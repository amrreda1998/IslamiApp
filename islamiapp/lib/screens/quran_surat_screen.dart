import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/reusable_widgets/helper_methods.dart';
import 'package:islamiapp/screens/quran_tab_screen.dart';

class QuranSuratScreen extends StatefulWidget {
  static int suratFileIndex = 1;
  const QuranSuratScreen({
    super.key,
  });
  static const String routeName = "QuransuratContent";

  @override
  State<QuranSuratScreen> createState() => _QuranSuratScreenState();
}

class _QuranSuratScreenState extends State<QuranSuratScreen> {
  List<String> suratContent = [];

  void getSurahContent(int suratFileIndex) async {
    //reading the target_file[index]
    String output = await rootBundle
        .loadString("assets/quran_content/${suratFileIndex + 1}.txt");

    List<String> outputList = output.split(
        "\n"); // convert the string into a list<strngs> to pass to the item builder

    //adding the verses number to the end of every line
    for (int verseindex = 0; verseindex < outputList.length; verseindex++) {
      String temp = outputList[verseindex];
      temp = temp.trim();
      String arabicVerseIndex =
          HelperMethods.convertToArabicNumber((verseindex + 1).toString());
      temp += " {$arabicVerseIndex}";
      // temp = temp.replaceAll("\n", "");
      suratContent.add(temp);
    }

    setState(() {});
  }

  // String convertToArabicNumber(String number) {
  //   String res = '';

  //   final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  //   for (var element in number.characters) {
  //     res += arabics[int.parse(element)];
  //   }
  //   return res;
  // }

  @override
  Widget build(BuildContext context) {
    if (suratContent.isEmpty) {
      getSurahContent(QuranSuratScreen.suratFileIndex);
    }

    return Stack(children: <Widget>[
      Image.asset("assets/images/background_image.png"),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            QuranTabScreen.suraNames[QuranSuratScreen.suratFileIndex],
            style: GoogleFonts.elMessiri(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Text(
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    suratContent.join(),
                    style: GoogleFonts.amiriQuran(
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
