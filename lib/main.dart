import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorTheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 108, 67, 205));

var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 9, 99, 125));

void main() {
  runApp(MaterialApp(
    home: const Expenses(),
    // darkTheme: ThemeData.dark().copyWith(
    //   useMaterial3: true,
    //   colorScheme: kDarkColorScheme,
    //   cardTheme: CardTheme().copyWith(
    //     color: kDarkColorScheme.secondaryContainer,
    //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //   ),
    //   elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         backgroundColor: kDarkColorScheme.primaryContainer,
    //         foregroundColor: kDarkColorScheme.onPrimaryContainer),
    //   ),
    // ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorTheme,
      appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorTheme.onPrimaryContainer,
          foregroundColor: kColorTheme.primaryContainer),
      cardTheme: CardTheme().copyWith(
        color: kColorTheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorTheme.primaryContainer),
      ),
    ),
    debugShowCheckedModeBanner: false,
    // themeMode: ThemeMode.dark,
  ));
}
