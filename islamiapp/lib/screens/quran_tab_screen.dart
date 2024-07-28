import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/reusable_widgets/helper_methods_and_attributes.dart';
import 'package:islamiapp/screens/quran_sura_content_screen.dart';

class QuranTabScreen extends StatefulWidget {
  const QuranTabScreen({super.key});
  static const String routeName = "Quran_tab_screen";
  static const primaryColor = Color(0xffB7935F);

  static const List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  static const List<int> versesNumber = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    5,
    19,
    5,
    8,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    6,
    3,
    6,
    3,
    5,
    4,
    5,
    6
  ];

  @override
  State<QuranTabScreen> createState() => _QuranTabScreenState();
}

class _QuranTabScreenState extends State<QuranTabScreen> {
  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/background_image.png",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "القرآن الكريم",
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
                    "assets/images/quran_tab_images/quran_img.png",
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "عدد الآيات",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "اسم السورة",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: QuranTabScreen.suraNames.length,
                              itemBuilder: (context, int index) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const QuranSuratScreen(),
                                        ),
                                      );
                                      QuranSuratScreen.suratFileIndex = index;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40),
                                          child: Text(
                                            HelperMethodsAndAttributes
                                                .convertToArabicNumber(
                                                    QuranTabScreen
                                                        .versesNumber[index]
                                                        .toString()),
                                            style:
                                                const TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          child: Text(
                                            QuranTabScreen.suraNames[index],
                                            style: GoogleFonts.amiriQuran(
                                              fontSize: 26,
                                            ),
                                          ),
                                        ),
                                      ],
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
                      color: QuranTabScreen.primaryColor,
                      height: 130,
                    ),
                    const Divider(
                      indent: 2,
                      thickness: 3,
                      color: QuranTabScreen.primaryColor,
                      // height: 70,
                    ),
                    const Center(
                      child: VerticalDivider(
                        thickness: 3,
                        color: QuranTabScreen.primaryColor,
                        indent: 7,
                      ),
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
