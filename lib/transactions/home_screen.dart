import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/theme/frugalistic_theme.dart';
import 'package:frugalistic/transactions/widgets/transaction_list.dart';

import 'transactions_provider.dart';
import 'widgets/transaction_amount.dart';
import 'widgets/transaction_divisions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  onTap: () => ref.watch(currentDateProvider.notifier).previous(),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  ref.watch(currentDateProvider).format("MMMM"),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
            const Dashboard(),
            const SizedBox(
              height: 5,
            ),
            const TransactionDivisions(),
            const TransactionList(),
          ],
        ),
      ),
    );
  }
}

class Dashboard extends ConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var expenseSum = ref.watch(totalExpenseAndIncomeAmountProvider);

    switch (expenseSum) {
      case AsyncData(:final value):
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[800], // Use a dark background color, e.g., Colors.grey[800]
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardRow(
                    label: 'Income',
                    amount: value.income,
                    labelColor: Theme.of(context).colorScheme.income),
                DashboardRow(
                    label: 'Expense',
                    amount: value.expense,
                    labelColor: Theme.of(context).colorScheme.expense),
                const Divider(
                  thickness: 1.5,
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ((expenseSum.requireValue.expense + expenseSum.requireValue.income) / 100)
                        .toStringAsFixed(0),
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        );
      case AsyncError(:final error):
        return Text('error: $error');
      default:
        return const Text('Loading');
    }
  }
}

class DashboardRow extends StatelessWidget {
  final String label;
  final Color labelColor;
  final int amount;

  const DashboardRow(
      {super.key, required this.label, required this.labelColor, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          color: labelColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5)
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: labelColor,
                ),
              ),
              TransactionAmount(
                amount: amount,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
