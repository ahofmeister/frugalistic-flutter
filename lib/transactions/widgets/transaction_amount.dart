import 'package:flutter/material.dart';
import 'package:frugalistic/theme/frugalistic_theme.dart';
import 'package:frugalistic/transactions/entity/TransactionType.dart';

import '../../transaction_utils.dart';

class TransactionAmount extends StatelessWidget {
  final int amount;
  final Color? color;
  final TransactionType? type;
  final TextStyle? textStyle;

  const TransactionAmount({super.key, required this.amount, this.color, this.type, this.textStyle});

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
    if (type != null) {
      switch (type) {
        case TransactionType.income:
          return Theme.of(context).colorScheme.income;
        case TransactionType.expense:
          return Theme.of(context).colorScheme.expense;
        case TransactionType.savings:
          return Theme.of(context).colorScheme.saving;
        case null:
          break;
      }
    }
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
