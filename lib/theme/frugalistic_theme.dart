import 'package:flutter/material.dart';

final ThemeData frugalisticTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFC74200),
    secondary: Color(0xFFC74200),
    background: Color(0xFF101112),
    onBackground: Colors.white,
  ),
  textTheme: TextTheme(
    headline1: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline3: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyText1: TextStyle(fontSize: 16.0, color: Colors.grey[300]),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Color(0xFFC74200),
      onPrimary: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0x00C74200),
    elevation: 0, // No shadow
    iconTheme: IconThemeData(color: Colors.white),
  ),
  scaffoldBackgroundColor: Color(0xFF101112), // Set the background color to neutral
  // Add additional customizations as needed
);

extension MyColorScheme on ColorScheme {
  Color get income => const Color(0xFF84F5F5);
  Color get expense => const Color(0xFFF58484);
  Color get primary => const Color(0xFFC74200);
  Color get neutral => const Color(0xFF101112);
}
