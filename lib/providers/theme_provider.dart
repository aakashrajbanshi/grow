import 'package:classapp/app/themes/dark_theme.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/locator.dart';
import 'package:flutter/material.dart';

import 'package:classapp/app/themes/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    getTheme();
  }

  ThemeData currentTheme = lightTheme;

  // to change the theme.
  changeTheme() {
    if (currentTheme == lightTheme) {
      currentTheme = darkTheme;
    } else {
      currentTheme = lightTheme;
    }
    saveTheme(currentTheme);
    notifyListeners();
  }

// to save the theme on local storage.
  saveTheme(ThemeData currentTheme) {
    locator<SharedPreferences>()
        .setBool(AppConstants.isDarkTheme, currentTheme == darkTheme);
  }

// to initialize the saved theme to shared preferences.
  getTheme() {
    bool? isDarkTheme =
        locator<SharedPreferences>().getBool(AppConstants.isDarkTheme);
    if (isDarkTheme != null && isDarkTheme == true) {
      currentTheme = darkTheme;
    } else {
      currentTheme = lightTheme;
    }
  }
}
