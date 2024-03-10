import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/analysis/year_expense_summary.dart';

import 'month_expense_card.dart';

class AnalysisScreen extends ConsumerWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 400, child: MonthExpenseCard()),
            SizedBox(height: 375, child: YearSummary())
          ],
        ),
      ),
    );
  }
}