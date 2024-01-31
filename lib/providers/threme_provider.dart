import 'package:flutter/material.dart';
import 'package:notification_app/core/themes/dark_theme.dart';
import 'package:notification_app/core/themes/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  // initial theme
  ThemeData _themeData = lightMode;
  // getter for this theme
  ThemeData get themeData => _themeData;

  // For dark mode
  bool get isDarkMode => _themeData == darkMode;

  // set the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // toggle theme mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
