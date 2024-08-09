import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/Themes/mythemedata.dart';
import 'package:islamiapp/reusable_widgets/helper_methods_and_attributes.dart';
import 'package:islamiapp/screens/quran_tab_screen.dart';
import 'package:islamiapp/screens/settings_tab_screen.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          HelperMethodsAndAttributes.convertToArabicNumber(
              (verseindex + 1).toString());
      temp += " {$arabicVerseIndex}";
      // temp = temp.replaceAll("\n", "");
      suratContent.add(temp);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (suratContent.isEmpty) {
      getSurahContent(QuranSuratScreen.suratFileIndex);
    }

    var provider = Provider.of<AppConfigProvider>(context);
    SettingsTabScreen.setBackgoroundImage(provider);

    return Stack(children: <Widget>[
      MyThemeData.appbackgroundimage,
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            QuranTabScreen.suraNames[QuranSuratScreen.suratFileIndex],
            style: GoogleFonts.elMessiri(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          // toolbarOpacity: 0,
          // toolbarHeight: -20,
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
