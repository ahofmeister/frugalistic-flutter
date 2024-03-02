import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../transactions_provider.dart';
import 'transaction_card.dart';

class TransactionList extends ConsumerWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var transactions = ref.watch(transactionsProvider);

    switch (transactions) {
      case AsyncData(:final value):
        return Flexible(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 0.5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[800],
            ),
            itemCount: value.length,
            itemBuilder: (context, index) => TransactionCard(transaction: value[index]),
          ),
        );
      case AsyncError(:final error):
        return Text('error: $error');
      default:
        return const Text('Loading');
    }
  }
}
