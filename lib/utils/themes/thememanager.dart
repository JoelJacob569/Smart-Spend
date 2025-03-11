import 'package:flutter/material.dart';

class Thememanager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeData => _themeMode;

  toggleTheme(bool isdark) {
    _themeMode = isdark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
