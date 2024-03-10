import 'package:flutter/material.dart';
import 'package:frugalistic/theme/frugalistic_theme.dart';

import '../../transaction_utils.dart';

class TransactionAmount extends StatelessWidget {
  final int amount;
  final Color? color;
  final TextStyle? textStyle;

  const TransactionAmount({super.key, required this.amount, this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      TransactionUtils.formatAmount(amount),
      style: style(context),
    );
  }

  TextStyle style(BuildContext context) {
    if (textStyle == null) {
      return TextStyle(color: getColor(context, amount));
    }

    return textStyle!.copyWith(color: getColor(context, amount));
  }

  Color getColor(BuildContext context, amount) {
    if (color != null) {
      return color!;
    }

    if (amount < 0) {
      return Theme.of(context).colorScheme.expense;
    }
    if (amount > 0) {
      return Theme.of(context).colorScheme.income;
    }

    return Theme.of(context).colorScheme.secondary;
  }
}
