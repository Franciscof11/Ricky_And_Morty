import 'package:flutter/material.dart';
import 'package:ricky_and_morty/shared/theme/data/app_theme.dart';
import 'package:ricky_and_morty/shared/theme/data/app_theme_model.dart';

class ApplicationTheme {
  static final themes = {
    AppTheme.light: AppThemeModel(
      theme: AppTheme.light,
      themeData: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        cardTheme: const CardTheme(elevation: 4),
      ),
    ),
    //
    AppTheme.dark: AppThemeModel(
      theme: AppTheme.dark,
      themeData: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    ),
  };
}
