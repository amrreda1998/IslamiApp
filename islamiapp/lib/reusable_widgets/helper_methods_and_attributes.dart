import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/screens/ahadieth_tab_screen.dart';
import 'package:islamiapp/screens/quran_tab_screen.dart';
import 'package:islamiapp/screens/radio_tab_screen.dart';
import 'package:islamiapp/screens/sebhaa_tab_screen.dart';
import 'package:islamiapp/screens/settings_tab_screen.dart';

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

  // A useful map for mapping routeNames and selected index in the bottom navbar
  static const Map<int, String> navbarItemToRourtName = {
    0: QuranTabScreen.routeName,
    1: SebhaaTabScreen.routeName,
    2: AhadiethTabScreen.routeName,
    3: RadioTabScreen.routeName,
    4: SettingsTabScreen.routeName,
  };

  //method to form a title for every hadieth in the list
  static String getAhadiethNames(index) {
    return ("الحديث رقم ${HelperMethodsAndAttributes.convertToArabicNumber(index.toString())}");
  }

  static List<String> listOfhadieth = [];

  // method to read all hadieth from the file and put them as strings in a list :
  static void getListOfhadieth(String filePath) async {
    //reading the target_file[index]
    String output = await rootBundle.loadString(filePath);

    List<String> outputlist = output.split("#");

    for (int i = 0; i < outputlist.length; i++) {
      //remove the first line of every hadieth before adding it the hadieth list
      listOfhadieth.add(outputlist[i].trim());
    }
  }

  //method to remove first line in a string
  static String removeFirstLine(String s) {
    List<String> temptList = s.split("\n");
    temptList.removeAt(0);
    return temptList.join();
  }

}

