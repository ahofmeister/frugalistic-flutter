import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/theme/frugalistic_theme.dart';

import '../transactions/entity/TransactionType.dart';
import '../transactions/transactions_provider.dart';
import '../transactions/widgets/transaction_amount.dart';

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
                    total: value.income,
                    type: TransactionType.income,
                    labelColor: Theme.of(context).colorScheme.income),
                DashboardRow(
                    label: 'Saving',
                    amount: value.saving,
                    total: value.income,
                    type: TransactionType.savings,
                    labelColor: Theme.of(context).colorScheme.saving),
                DashboardRow(
                  label: 'Expense',
                  total: value.income,
                  amount: value.expense,
                  type: TransactionType.expense,
                  labelColor: Theme.of(context).colorScheme.expense,
                ),
                const Divider(
                  thickness: 1.5,
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ((expenseSum.requireValue.expense +
                                expenseSum.requireValue.income +
                                expenseSum.requireValue.saving) /
                            100)
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
  final TransactionType type;
  final int total;

  const DashboardRow(
      {super.key,
      required this.label,
      required this.labelColor,
      required this.amount,
      required this.type,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        decoration: BoxDecoration(
            color: labelColor.withOpacity(0.3), borderRadius: BorderRadius.circular(5)),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TransactionAmount(
                    amount: amount,
                    type: type,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${((amount / total).abs() * 100).roundToDouble().toStringAsFixed(0)}%',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: labelColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
