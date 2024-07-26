import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/reusable_widgets/helper_methods.dart';
import 'package:islamiapp/screens/quran_tab_screen.dart';

class SebhaaTabScreen extends StatefulWidget {
  const SebhaaTabScreen({super.key});
  static const String routeName = "Sebhaa_tab_screen";
  static const primaryColor = Color(0xffB7935F);

  @override
  State<SebhaaTabScreen> createState() => _SebhaaTabScreenState();
}

class _SebhaaTabScreenState extends State<SebhaaTabScreen> {
  int selectedItemIndex = 1;
  int tasbehatCount = 0;
  List<String> tasbehatList = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
    "لااله الا الله"
  ];
  int tasbehatIndex = 0;
  double sebhaaRotateAngel = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("assets/images/background_image.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "السبحة",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(
              canvasColor: const Color(0xffB7935F),
            ),
            child: BottomNavigationBar(
              currentIndex: selectedItemIndex,
              onTap: (index) {
                setState(() {
                  if (selectedItemIndex != index) {
                    selectedItemIndex = index;
                    Navigator.pushNamed(
                      context,
                      HelperMethodsAndAttributes.navbarItemToRourtName[index]
                          .toString(),
                    );
                  }
                });
              },
              selectedItemColor: const Color(0xff242424),
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                          "assets/images/quran_tab_images/quran_icon.png"),
                      size: 62,
                    ),
                    label: "القرآن"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/quran_tab_images/sebha.png"),
                      size: 62,
                    ),
                    label: "السبحة"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/quran_tab_images/hadieth.png"),
                      size: 62,
                    ),
                    label: "الحديث"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/quran_tab_images/radio.png"),
                      size: 62,
                    ),
                    label: "الراديو"),
              ],
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        tasbehatCount++;
                        sebhaaRotateAngel += 0.3;
                        if (tasbehatIndex < 3) {
                          tasbehatIndex++;
                        } else {
                          tasbehatIndex = 0;
                        }
                      });
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 50),
                          child: Image.asset(
                            "assets/images/sebha_head.png",
                          ),
                        ),
                        Transform.rotate(
                          origin: const Offset(1, 30),
                          angle: sebhaaRotateAngel,
                          child: Container(
                            margin: const EdgeInsets.only(top: 60),
                            child: Image.asset(
                              "assets/images/sebha_body.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: QuranTabScreen.primaryColor,
                    ),
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        tasbehatCount.toString(),
                        style: GoogleFonts.elMessiri(fontSize: 28),
                      ),
                    ),
                  ),
                  Container(
                    //tasehat counter label

                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: QuranTabScreen.primaryColor,
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      " : عدد التسبيحات",
                      style: GoogleFonts.elMessiri(fontSize: 30),
                    ),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: QuranTabScreen.primaryColor,
                ),
                margin: const EdgeInsets.all(10),
                child: Text(
                  tasbehatList[tasbehatIndex],
                  style: GoogleFonts.elMessiri(fontSize: 30),
                ),
              ),
              // const Text("Sura Name"),
            ],
          ),
        ),
      ],
    );
  }
}
