import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'transactions_provider.dart';
import 'widgets/transaction_amount.dart';
import 'widgets/transaction_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var transactions = ref.watch(transactionListProvider).value;
    var expenseSum = ref.watch(totalExpenseAndIncomeAmountProvider);

    if (transactions == null || transactions.isEmpty) {
      return const Text("No transactions");
    }

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
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTap: () => ref.watch(currentDateProvider.notifier).previous(),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                ref.watch(currentDateProvider).format("MMMM"),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                child: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTap: () => ref.watch(currentDateProvider.notifier).next(),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  TransactionAmount(amount: expenseSum.requireValue.income),
                  TransactionAmount(amount: expenseSum.requireValue.expense),
                ],
              ),

            ],
          ),
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 3),
              itemCount: transactions!.length,
              itemBuilder: (context, index) => TransactionCard(transaction: transactions[index]),
            ),
          ),
        ],
      ),
    ));
  }
}
