import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  //data that cause changes in the state of specific or all widgets in the app
  String appLanguage = "en";
  ThemeMode thememode = ThemeMode.system;
  //function to change the value of that data
  void changeLanguage(String newLang) {
    if (appLanguage == newLang) {
      return;
    } else {
      appLanguage = newLang;
      notifyListeners();
    }
  }

    void changeTheme(ThemeMode newTheme) {
    if (thememode == newTheme) {
      return;
    } else {
      thememode = newTheme;
      notifyListeners();
    }
  }
  
}
