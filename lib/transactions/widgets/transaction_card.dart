import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../entity/transaction.dart';
import 'transaction_amount.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat("EEE").format(DateTime.parse(transaction.datetime)),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    DateFormat("dd. MMM").format(DateTime.parse(transaction.datetime)),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(transaction.category.name),
              ],
            ),
          ),
          // Text(DateFormat.d().format(DateTime.parse(transaction.datetime))),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: TransactionAmount(amount: transaction.amount),
            ),
          ),
        ],
      ),
    );
  }
}
