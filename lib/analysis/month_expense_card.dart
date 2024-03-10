import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/analysis/analysis_config.dart';

import '../transactions/entity/transaction_category_summary.dart';
import '../transactions/transactions_provider.dart';
import '../transactions/widgets/transaction_amount.dart';

class MonthExpenseCard extends ConsumerWidget {
  const MonthExpenseCard({super.key});

  List<PieChartSectionData> showingSections(List<TransactionCategorySummary> value) {
    late List<Color> colors = [
      Colors.blueGrey,
      Colors.red,
      Colors.blue,
      Colors.white,
      Colors.purpleAccent,
      Colors.yellow,
      Colors.greenAccent,
      Colors.orange,
      Colors.white
    ];
    return value
        .asMap()
        .entries
        .map((entry) => PieChartSectionData(
            title: '', color: colors[entry.key], value: entry.value.total.abs().toDouble()))
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(monthOverviewProvider);

    var transactionByCategory = ref.watch(transactionsByCategoryProvider);
    return Card(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Expenses for current month",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: PieChart(
                      PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              return;
                            }
                            ref.watch(monthOverviewProvider.notifier).state =
                                (pieTouchResponse.touchedSection!.touchedSectionIndex);
                          }),
                          sections: showingSections(transactionByCategory.value!),
                          sectionsSpace: 0,
                          centerSpaceRadius: 90,
                          centerSpaceColor: Colors.grey),
                    ),
                  ),
                  if (watch != -1)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(watch == -1 ? '' : transactionByCategory.value![watch].name),
                        TransactionAmount(
                          amount: transactionByCategory.value![watch].total,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  // TransactionAmount(
                  //     textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  //     amount: transactionByCategory.value!
                  //         .map((e) => e.total)
                  //         .reduce((value, element) => value + element))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 0.1),
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
                        fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
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
  }
}
