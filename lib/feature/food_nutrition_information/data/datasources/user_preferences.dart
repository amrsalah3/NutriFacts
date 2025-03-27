import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class UserPreferences {
  const UserPreferences(this._prefs);

  final SharedPreferences _prefs;

  static const _themeColor = "THEME_COLOR";

  Future<bool> setThemeColor(Color color) async =>
      _prefs.setInt(_themeColor, color.value);

  Color getThemeColor() {
    final colorCode = _prefs.getInt(_themeColor);
    return Color(colorCode ?? Colors.green.value);
  }
}
