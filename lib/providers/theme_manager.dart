//lib\providers\theme_manager.dart
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light; 

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}