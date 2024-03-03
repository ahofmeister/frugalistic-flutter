import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/string/string_extension.dart';

import '../transactions_provider.dart';
import 'transaction_amount.dart';

class TransactionDivisions extends ConsumerWidget {
  const TransactionDivisions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var divisions = ref.watch(totalExpenseByDivisionProvider);

    switch (divisions) {
      case AsyncData(:final value):
        return Row(
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
                color: division.color,
              ),
              child: Column(
                children: [
                  TransactionAmount(amount: amount, color: Theme.of(context).primaryColor,),
                  Text(division.name.capitalize()),
                ],
              ),
            );
          }).toList(),
        );
      case AsyncError(:final error):
        return Text('error: $error');
      default:
        return const Text('Loading');
    }
  }
}
