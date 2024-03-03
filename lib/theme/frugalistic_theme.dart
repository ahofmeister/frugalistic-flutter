import 'package:flutter/material.dart';

final ThemeData frugalisticTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    primary: Color(0x00C74200),
    secondary: Color(0x00C74200),
  ),
  appBarTheme: const AppBarTheme(foregroundColor: Colors.purpleAccent),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
    selectedItemColor: const Color(0xFFC74200),
    unselectedItemColor: Colors.grey[500],
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF66396D)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ))),
  ),
);

extension MyColorScheme on ColorScheme {
  Color get income => const Color(0xFF84F5F5);

  Color get expense => const Color(0xFFF58484);

  Color get primary => const Color(0xFFD85311);

  Color get neutral => const Color(0xFF101112);
}
