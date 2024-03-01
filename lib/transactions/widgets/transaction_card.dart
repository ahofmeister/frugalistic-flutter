import 'package:frugalistic/transactions/entity/transaction.dart';
import 'package:frugalistic/transactions/widgets/transaction_amount.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade900,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(DateFormat.MMM().format(DateTime.parse(transaction.datetime))),
              Text(DateFormat.d().format(DateTime.parse(transaction.datetime))),
            ],
          ),
          Column(
            children: [
              Text(transaction.category.name),
              Text(transaction.description),
            ],
          ),
          TransactionAmount(amount: (transaction.amount)),
        ],
      ),
    );
  }
}
