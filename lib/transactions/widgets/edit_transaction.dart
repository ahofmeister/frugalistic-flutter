import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/theme/frugalistic_theme.dart';

import '../../category/provider/categories_provider.dart';
import '../../category/entity/category.dart';
import '../entity/TransactionType.dart';
import '../entity/transaction.dart';
import '../masked_text_controller.dart';
import '../transactions_provider.dart';

class EditTransaction extends ConsumerStatefulWidget {
  const EditTransaction({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _EditTransactionState();
  }
}

class _EditTransactionState extends ConsumerState<EditTransaction> {
  var descriptionController = TextEditingController();
  var amountController = MoneyMaskedTextController();
  Category? currentCategory;
  DateTime currentDateTime = DateTime.now();

  TransactionType type = TransactionType.expense;

  @override
  Widget build(BuildContext context) {
    var categories = ref.watch(categoriesProvider);
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: type == TransactionType.income
                        ? Theme.of(context).colorScheme.income
                        : Theme.of(context).colorScheme.onBackground,
                  )),
                  child: InkWell(
                    onTap: () => {
                      setState(() {
                        type = TransactionType.income;
                      })
                    },
                    child: Text(
                      "Income",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: type == TransactionType.income
                            ? Theme.of(context).colorScheme.income
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: type == TransactionType.expense
                          ? Theme.of(context).colorScheme.expense
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  child: InkWell(
                    onTap: () => {setState(() => type = TransactionType.expense)},
                    child: Text(
                      "Expense",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: type == TransactionType.expense
                            ? Theme.of(context).colorScheme.expense
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              textAlign: TextAlign.center,
              controller: amountController,
              cursorWidth: 2,
              cursorColor: type == TransactionType.expense
                  ? Theme.of(context).colorScheme.expense
                  : Theme.of(context).colorScheme.income,
              decoration: const InputDecoration.collapsed(hintText: ''),
              style: TextStyle(
                  fontSize: 42,
                  color: type == TransactionType.expense
                      ? Theme.of(context).colorScheme.expense
                      : Theme.of(context).colorScheme.income),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  child: const Text(
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      initialDate: DateTime.now(),
                      context: context,
                      firstDate: DateTime.now().subtract(Duration(days: 10000)),
                      lastDate: DateTime.now().add(Duration(days: 10000)),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        currentDateTime = pickedDate;
                      });
                    }
                  },
                ),
              ),
               Text(currentDateTime.toIso8601String()),
              const Icon(Icons.date_range)
            ],
          ),
          const SizedBox(height: 15),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 45,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration.collapsed(
              hintText: 'Description',
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          const SizedBox(height: 30),
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                if (currentCategory == null) const Icon(Icons.grid_view),
                if (currentCategory != null) Text(currentCategory!.name)
              ],
            ),
            onTap: () => {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.black,
                  builder: (context) {
                    if (categories.isLoading) {
                      return const Center(child: Text("LOADING!"));
                    }
                    return GridView.count(
                      crossAxisCount: 3,
                      children: categories.value!
                          .map((category) => GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => setState(() {
                                  currentCategory = category;
                                  Navigator.pop(context);
                                }),
                                child: Container(
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                                  child: Center(
                                    child: Text(category.name),
                                  ),
                                ),
                              ))
                          .toList(),
                    );
                  },
                  isDismissible: false)
            },
          ),
          const SizedBox(
            height: 45,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: (() => {
                          if (currentCategory != null)
                            {
                              ref.watch(transactionsProvider.notifier).addTransaction(
                                  type,
                                  Transaction(
                                      description: descriptionController.text,
                                      amount: amountController.intValue,
                                      category: currentCategory!,
                                      datetime: currentDateTime!.toIso8601String()))
                            }
                        }),
                    child: const Text(
                      "Add",
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
