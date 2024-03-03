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
            child: TextFormField(
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
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.expense)),
          ),
          const SizedBox(
            height: 45,
          ),
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Category"),
                Text(currentCategory == null ? "-" : currentCategory!.name),
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
                                      datetime: DateTime.now().toIso8601String()))
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
