import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  //data that cause changes in the state of specific or all widgets in the app
  String appLanguage = "en";
  ThemeMode thememode = ThemeMode.light;
  //function to change the value of that data
  void changeLanguage(String newLang) {
    // ignore: unnecessary_null_comparison
    if (appLanguage == newLang || newLang == null) {
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

  bool isDark(){
    if(thememode == ThemeMode.dark){
      return(true);
    }
    else{
      return false;
    }
  }
  String? getAppLanguage(){
    return appLanguage;
  }
    ThemeMode getThemeMode(){
    return thememode;
  }
}
