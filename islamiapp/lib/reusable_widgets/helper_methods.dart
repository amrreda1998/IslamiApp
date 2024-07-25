

import 'package:flutter/material.dart';

class HelperMethods{


    //method to convert numbers in a string to its arabic fomat
    static String convertToArabicNumber(String number) {
    String res = '';

    final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (var element in number.characters) {
      res += arabics[int.parse(element)];
    }
    return res;
  }

}