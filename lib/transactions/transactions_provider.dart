import 'package:frugalistic/category/entity/category_division.dart';
import 'package:frugalistic/transactions/entity/TransactionType.dart';
import 'package:frugalistic/transactions/entity/transaction.dart';
import 'package:frugalistic/transactions/entity/transaction_year_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../date/date.dart';

part 'transactions_provider.g.dart';

@riverpod
class CurrentDate extends _$CurrentDate {
  @override
  Date build() => Date.now();

  void previous() => state = state.subtract(months: 1);

  void next() => state = state.add(months: 1);
}

@Riverpod(keepAlive: true)
class Transactions extends _$Transactions {
  @override
  Future<List<Transaction>> build() async {
    var currentDate = ref.read(currentDateProvider);
    List<Map<String, dynamic>> response = await Supabase.instance.client
        .from("transactions")
        .select("id, description, amount, datetime, category(id, name, division) ")
        .gte('datetime', currentDate.firstOfMonth().toString())
        .lte('datetime', currentDate.lastOfMonth().toString())
        .order('datetime', ascending: false)
        .order("created_at", ascending: false);
    return response.map((e) => Transaction.fromJson(e)).toList();
  }

  Future<void> addTransaction(TransactionType type, Transaction transaction) async {
    await Supabase.instance.client.from("transactions").insert({
      "user_id": Supabase.instance.client.auth.currentUser!.id,
      "description": transaction.description,
      "datetime": transaction.datetime,
      "amount": type == TransactionType.income
          ? (transaction.amount).toInt()
          : -(transaction.amount).toInt(),
      "category": transaction.category.id
    });
    ref.invalidateSelf();
  }

  void removeTransaction(Transaction value) async {
    await Supabase.instance.client.from("transactions").delete().eq("id", value.id!);
  }
}

class ExpenseIncomeTotal {
  int expense;
  int income;

  ExpenseIncomeTotal({required this.expense, required this.income});
}

@riverpod
Future<ExpenseIncomeTotal> totalExpenseAndIncomeAmount(TotalExpenseAndIncomeAmountRef ref) async {
  List<Transaction> list = await ref.watch(transactionsProvider.future);

  ExpenseIncomeTotal result =
      list.fold(ExpenseIncomeTotal(expense: 0, income: 0), (acc, transaction) {
    if (transaction.amount < 0) {
      acc.expense += transaction.amount;
    } else {
      acc.income += transaction.amount;
    }
    return acc;
  });

  return result;
}

@riverpod
Future<Map<CategoryDivision, int>> totalExpenseByDivision(TotalExpenseByDivisionRef ref) async {
  List<Transaction> list = await ref.watch(transactionsProvider.future);

  Map<CategoryDivision, int> totalExpensesByDivision = {
    for (var division in CategoryDivision.values) division: 0
  };

  for (Transaction transaction in list) {
    if (transaction.amount < 0) {
      final CategoryDivision division = transaction.category.division;
      totalExpensesByDivision[division] =
          (totalExpensesByDivision[division] ?? 0) + transaction.amount;
    }
  }

  return totalExpensesByDivision;
}

@riverpod
Future<List<TransactionYearSummary>> toti(TotiRef ref) async {
  List<Map<String, dynamic>> response =
      await Supabase.instance.client.rpc("transaction_year_summary2", params: {'year': 2024});
  return response.map((e) => TransactionYearSummary.fromJson(e)).toList();
}
