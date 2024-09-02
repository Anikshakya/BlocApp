import 'package:flutter/material.dart';

// Enum to define the app's themes
enum AppTheme {
  light,
  dark,
}

// Centralized theme data
final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, color: Colors.black),
      displayMedium: TextStyle(fontSize: 28, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
    ),
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, color: Colors.white),
      displayMedium: TextStyle(fontSize: 28, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
    ),
  ),
};

// Customizable font sizes
class FontSizes {
  static const double headline1 = 32;
  static const double headline2 = 28;
  static const double bodyText1 = 16;
  static const double bodyText2 = 14;
}

// Centralized text colors
class TextColors {
  static const Color lightTextColor = Colors.black;
  static const Color darkTextColor = Colors.white;
}
