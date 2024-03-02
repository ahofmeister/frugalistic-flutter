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
  Widget build(BuildContext context) {
    var transactions = ref.watch(transactionListProvider);
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
          SizedBox(height: 25,),
          const TransactionDivisions(),
          if (!transactions.isLoading)
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
              itemCount: transactions.value!.length,
              itemBuilder: (context, index) =>
                  TransactionCard(transaction: transactions.value![index]),
            ),
          ),
        ],
      ),
    ));
  }
}

class TransactionDivisions extends ConsumerWidget {
  const TransactionDivisions({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var divisions = ref.watch(totalExpenseByDivisionProvider);

    switch (divisions) {
      case AsyncData(:final value):
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: value.entries.map((entry) {
                    final division = entry.key;
                    final amount = entry.value;

                    return Column(
                      children: [Text(division.name), TransactionAmount(amount: amount)],
                    );
                  }).toList() ??
                  [],
            ),
          ],
        );
      case AsyncError(:final error):
        return Text('error: $error');
      default:
        return const Text('Loading');
    }
  }
}
