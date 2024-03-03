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
                child: Icon(
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
    ));
  }
}

class Dashboard extends ConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var expenseSum = ref.watch(totalExpenseAndIncomeAmountProvider);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[800], // Use a dark background color, e.g., Colors.grey[800]
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            _buildDashboardItem(
                'Expense', expenseSum.requireValue.expense, Theme.of(context).colorScheme.expense),
            _buildDashboardItem(
                'Income', expenseSum.requireValue.income, Theme.of(context).colorScheme.income),
            Divider(thickness: 0.5, height: 10,),
            _buildDashboardItem(
              'Balance',
              expenseSum.requireValue.expense + expenseSum.requireValue.income,
              Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(String label, int amount, Color labelColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
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
          TransactionAmount(amount: amount),
        ],
      ),
    );
  }
}
