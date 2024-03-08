import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/category/categories_screen.dart';
import 'package:frugalistic/transactions/transactions_provider.dart';
import 'package:frugalistic/transactions/widgets/transaction_amount.dart';
import 'package:intl/intl.dart';

import '../profile/profile_page.dart';
import '../transactions/home_screen.dart';
import '../transactions/widgets/edit_transaction.dart';

class PageSelector extends StatefulWidget {
  const PageSelector({super.key});

  @override
  PageSelectorState createState() => PageSelectorState();
}

class PageSelectorState extends State<PageSelector> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    EditTransaction(),
    CompareMonthScreen(),
    CategoriesScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CompareMonthScreen extends ConsumerWidget {
  const CompareMonthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(totiProvider);

    return DataTable(
      dividerThickness: 0.3,
      rows: watch.value!
          .map((e) => DataRow(cells: [
                DataCell(
                    Text(DateFormat('MMM.').format(DateTime(DateTime.now().year, e.month, 1)))),
                DataCell(TransactionAmount(amount: e.income)),
                DataCell(TransactionAmount(amount: e.expense)),
                DataCell(TransactionAmount(amount: e.expense + e.income))
              ]))
          .toList(),
      columns: const [
        DataColumn(label: Text("month")),
        DataColumn(label: Text("income"), numeric: true),
        DataColumn(label: Text("expense"), numeric: true),
        DataColumn(label: Text("total"), numeric: true),
      ],
    );
  }
}
