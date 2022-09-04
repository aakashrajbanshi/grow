import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  LanguageProvider() {
    getLanguage();
  }

  Locale currentLocale = Locale('en');

  // to change the language.
  changeLocale() {
    if (currentLocale == Locale('en')) {
      currentLocale = Locale('ne');
    } else {
      currentLocale = Locale('en');
    }
    saveLanguage(currentLocale);
    notifyListeners();
  }

  // to set english language.
  setEnglish() {
    currentLocale = Locale("en");
    saveLanguage(currentLocale);
    notifyListeners();
  }

  // to set english language.
  setNepali() {
    currentLocale = Locale("ne");
    saveLanguage(currentLocale);
    notifyListeners();
  }

  // to save the language to shared preferences.
  saveLanguage(Locale locale) {
    locator<SharedPreferences>().setBool(
      AppConstants.isEnglish,
      locale == Locale('en'),
    );
  }

// to initialize the saved language to shared preferences.
  getLanguage() {
    bool? isEnglish =
        locator<SharedPreferences>().getBool(AppConstants.isEnglish);
    if (isEnglish != null && isEnglish != true) {
      currentLocale = Locale('ne');
    } else {
      currentLocale = Locale('en');
    }
    notifyListeners();
  }
}
