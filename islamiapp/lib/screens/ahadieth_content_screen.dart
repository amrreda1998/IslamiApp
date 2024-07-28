import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/reusable_widgets/helper_methods_and_attributes.dart';

class HadiethContentScreen extends StatefulWidget {
  static int hadiethindex = 0;

  const HadiethContentScreen({
    super.key,
  });
  static const String routeName = "HadiethContentScreen";

  @override
  State<HadiethContentScreen> createState() => _HadiethContentScreen();
}

class _HadiethContentScreen extends State<HadiethContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset("assets/images/background_image.png"),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            HelperMethodsAndAttributes.getAhadiethNames(
                HadiethContentScreen.hadiethindex + 1),
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
                    HelperMethodsAndAttributes.removeFirstLine(
                        HelperMethodsAndAttributes
                            .listOfhadieth[HadiethContentScreen.hadiethindex]),
                    style: GoogleFonts.notoKufiArabic(
                      fontSize: 22,
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
