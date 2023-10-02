import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData theme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(15, 15, 15, 1),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      //colorScheme: ColorScheme.dark(primary: Colors.orange.shade800),
      colorScheme: ColorScheme.dark(
        background: const Color.fromRGBO(15, 15, 15, 1),
        primary: Colors.orange.shade800,
      ),
      dividerTheme: DividerThemeData(color: Colors.grey.shade800),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      useMaterial3: true,
    );
  }
}
