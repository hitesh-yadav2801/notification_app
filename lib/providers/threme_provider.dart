import 'package:flutter/material.dart';
import 'package:notification_app/core/themes/dark_theme.dart';
import 'package:notification_app/core/themes/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  // initial theme will be set to light
  ThemeData _themeData = lightMode;
  // getter method for this theme
  ThemeData get themeData => _themeData;

  // For dark mode
  bool get isDarkMode => _themeData == darkMode;

  // setting the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // toggle the theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
