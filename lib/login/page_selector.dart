import 'package:flutter/material.dart';
import 'package:frugalistic/category/categories_screen.dart';

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
        // unselectedIconTheme: Theme.of(context).iconTheme,
        // selectedIconTheme: Theme.of(context).primaryIconTheme,
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
            icon: Icon(Icons.shopping_cart),
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
