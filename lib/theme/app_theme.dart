import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Palette.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Palette.blueColor,
    ),
  );
}
