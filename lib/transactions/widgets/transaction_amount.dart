import 'package:flutter/material.dart';
import 'package:frugalistic/theme/frugalistic_theme.dart';

import '../../transaction_utils.dart';

class TransactionAmount extends StatelessWidget {
  final int amount;

  const TransactionAmount({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Text(
      TransactionUtils.formatAmount(amount),
      style: TextStyle(color: getColor(context, amount)),
    );
  }

  Color getColor(BuildContext context, amount) {
    if (amount < 0) {
      return Theme.of(context).colorScheme.expense;
    }
    if (amount > 0) {
      return Theme.of(context).colorScheme.income;
    }

    return Theme.of(context).colorScheme.onPrimary;
  }
}
