import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: const Color(0xFF1D2228),
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF1D2228),
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'Montserrat',
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF202619),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF2A2E37),
    ),
  );
}

class TextStyles {
  static const TextStyle header = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

class IconTheme {
  static const String add = 'assets/icons/add.png';
  static const Color addColor = Colors.grey;
}