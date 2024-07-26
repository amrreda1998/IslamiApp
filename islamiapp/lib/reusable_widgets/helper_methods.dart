import 'package:flutter/material.dart';
import 'package:islamiapp/screens/quran_tab_screen.dart';
import 'package:islamiapp/screens/sebhaa_tab_screen.dart';

class HelperMethodsAndAttributes {
  //method to convert numbers in a string to its arabic fomat
  static String convertToArabicNumber(String number) {
    String res = '';

    final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (var element in number.characters) {
      res += arabics[int.parse(element)];
    }
    return res;
  }

  static const Map<int, String> navbarItemToRourtName = {
    0: QuranTabScreen.routeName,
    1: SebhaaTabScreen.routeName,
  };
}
