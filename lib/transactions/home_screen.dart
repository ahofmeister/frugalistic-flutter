import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/string/string_extension.dart';

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
          const SizedBox(
            height: 25,
          ),
          if (!transactions.isLoading)
            Column(
              children: [
                TransactionAmount(amount: expenseSum.requireValue.income),
                TransactionAmount(amount: expenseSum.requireValue.expense),
                TransactionAmount(amount: expenseSum.requireValue.expense + expenseSum.requireValue.income),
              ],
            ),
          const TransactionDivisions(),
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 0.5,
                indent: 20,
                endIndent: 20,
                color: Colors.grey[800],
              ),
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
  const TransactionDivisions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var divisions = ref.watch(totalExpenseByDivisionProvider);

    switch (divisions) {
      case AsyncData(:final value):
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: value.entries.map((entry) {
                final division = entry.key;
                final amount = entry.value;

                final isFirstItem = division == value.entries.first.key;
                final isLastItem = division == value.entries.last.key;
                var roundedBorderValue = 5.0;
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isFirstItem ? roundedBorderValue : 0),
                      topRight: Radius.circular(isLastItem ? roundedBorderValue : 0),
                      bottomLeft: Radius.circular(isFirstItem ? roundedBorderValue : 0),
                      bottomRight: Radius.circular(isLastItem ? roundedBorderValue : 0),
                    ),
                    color: Colors.brown,
                  ),
                  child: Column(
                    children: [
                      TransactionAmount(amount: amount),
                      Text(division.name.capitalize()),
                    ],
                  ),
                );
              }).toList(),
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
