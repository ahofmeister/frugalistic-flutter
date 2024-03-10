import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/transactions/widgets/transaction_list.dart';

import '../dashboard/dashboard.dart';
import 'transactions_provider.dart';
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
