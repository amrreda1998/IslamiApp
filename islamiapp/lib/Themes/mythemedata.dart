import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islamiapp/screens/settings_tab_screen.dart';

class MyThemeData {
  static final ThemeData light_theme = ThemeData(
    primaryColor: const Color(0xffB7935F),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      centerTitle: true,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      // backgroundColor: Color(0xffB7935F), does not work so i used canvas color way
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData dark_theme = ThemeData(
    primaryColor: const Color(0xff141A2E),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xffB7935F),
      unselectedItemColor: Colors.white,
      // backgroundColor: Color(0xff141A2E), does not work so i used canvas color way
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  //background image for the entire app
  static Image appbackgroundimage =
      Image.asset("assets/images/background_image.png");
  setBackgoroundImage() {
    if (SettingsTabScreen.choosenTheme == "Light Theme" ||
        SettingsTabScreen.choosenTheme == "الوضع النهارى") {
          appbackgroundimage = Image.asset("assets/images/background_image.png");
    } else if (SettingsTabScreen.choosenTheme == "Dark Theme" ||
        SettingsTabScreen.choosenTheme == "الوضع الليلى") {
          appbackgroundimage = Image.asset("assets/images/background_image_dark.png");
        }
  }
}
