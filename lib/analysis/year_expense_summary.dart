import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/theme/frugalistic_theme.dart';
import 'package:frugalistic/transactions/entity/transaction_year_summary.dart';

import '../transactions/transactions_provider.dart';

class YearSummary extends ConsumerWidget {
  const YearSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(totiProvider);

    switch (watch) {
      case AsyncData(:final value):
        return Card(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Expenses per year",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: BarChart(
                        BarChartData(
                          maxY: findMax(value),
                          titlesData: const FlTitlesData(
                            leftTitles: AxisTitles(),
                            topTitles: AxisTitles(),
                          ),
                          gridData:
                              const FlGridData(drawVerticalLine: false, horizontalInterval: 1000),
                          barGroups: value.map((element) {
                            return BarChartGroupData(x: element.month, barRods: [
                              BarChartRodData(
                                  toY: (element.income.toDouble() / 100),
                                  color: Theme.of(context).colorScheme.income),
                              BarChartRodData(
                                  toY: (element.expense.toDouble() / 100) * -1,
                                  color: Theme.of(context).colorScheme.expense),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "More",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );

      case AsyncError(:final error):
        return Text('error: $error');
      default:
        return const Text('Loading');
    }
  }

  double findMax(List<TransactionYearSummary> yearSummaries) {
    int maxIncome = yearSummaries.fold(0, (total, current) => max(total, current.income));
    int maxExpense = yearSummaries.fold(0, (total, current) => max(total, -current.expense));

    int maxPropertyValue = max(maxIncome, maxExpense);

    return roundToNext500(maxPropertyValue / 100).toDouble();
  }

  double roundToNext500(double value) {
    double remainder = value % 500;
    if (remainder == 0) {
      return value;
    }
    return value + (500 - remainder);
  }
}
