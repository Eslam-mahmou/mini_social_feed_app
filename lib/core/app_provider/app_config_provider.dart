import 'package:flutter/material.dart';

import '../service/shared_pref_helper.dart';
import '../utils/app_constant.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    currentTheme=newTheme;
    saveTheme(newTheme);
    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }

  void saveTheme(ThemeMode themeMode) async {
    if (themeMode == ThemeMode.light) {
      SharedPrefHelper.setDate(AppConstants.themeKey, AppConstants.lightTheme);
    } else {
      SharedPrefHelper.setDate(AppConstants.themeKey, AppConstants.darkTheme);
    }
  }

  void getTheme() async {
    String? theme = SharedPrefHelper.getString(AppConstants.themeKey);
    if (theme == AppConstants.lightTheme) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

}



