import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/transactions/widgets/transaction_list.dart';

import 'transactions_provider.dart';
import 'widgets/transaction_amount.dart';
import 'widgets/transaction_divisions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var expenseSum = ref.watch(totalExpenseAndIncomeAmountProvider);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.chevron_left,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                onTap: () => ref.watch(currentDateProvider.notifier).previous(),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                ref.watch(currentDateProvider).format("MMMM"),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                child: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                onTap: () => ref.watch(currentDateProvider.notifier).next(),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          if (!expenseSum.isLoading)
            Column(
              children: [
                TransactionAmount(
                    amount: expenseSum.requireValue.expense + expenseSum.requireValue.income),
                TransactionAmount(amount: expenseSum.requireValue.income),
                TransactionAmount(amount: expenseSum.requireValue.expense),
              ],
            ),
          const SizedBox(height: 10,),
          const TransactionDivisions(),
          const SizedBox(height: 10,),
          const TransactionList(),
        ],
      ),
    ));
  }
}
