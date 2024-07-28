import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/reusable_widgets/helper_methods_and_attributes.dart';
import 'package:islamiapp/screens/ahadieth_content_screen.dart';

class AhadiethTabScreen extends StatefulWidget {
  const AhadiethTabScreen({super.key});
  static const String routeName = "Ahadieth_tab_screen";
  static const primaryColor = Color(0xffB7935F);
  static List<String> listOfhadieth = [];

  @override
  State<AhadiethTabScreen> createState() => _AhadiethTabScreenState();
}

class _AhadiethTabScreenState extends State<AhadiethTabScreen> {
  int selectedItemIndex = 2;

  @override
  Widget build(BuildContext context) {
    //prepare the list of hadeith 
    //read all ahadieth from the file then put them in this list
    HelperMethodsAndAttributes.getListOfhadieth("assets/ahadeith_content/ahadeth.txt");

    return Stack(
      children: <Widget>[
        Image.asset("assets/images/background_image.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "الأحاديث",
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
                  Image.asset(
                    "assets/images/basmala_islamic_icon.png",
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              "الأحاديث",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 50,
                              itemBuilder: (context, int index) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HadiethContentScreen(),
                                        ),
                                      );
                                      HadiethContentScreen.hadiethindex = index;
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          HelperMethodsAndAttributes
                                              .getAhadiethNames(index + 1),
                                          style: GoogleFonts.amiriQuran(
                                            fontSize: 26,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 2,
                      thickness: 3,
                      color: AhadiethTabScreen.primaryColor,
                      height: 130,
                    ),
                    const Divider(
                      indent: 2,
                      thickness: 3,
                      color: AhadiethTabScreen.primaryColor,
                      // height: 70,
                    ),
                  ],
                ),
              )

              // const Text("Sura Name"),
            ],
          ),
        ),
      ],
    );
  }
}
