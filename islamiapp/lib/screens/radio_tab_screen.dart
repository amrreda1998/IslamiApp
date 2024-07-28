import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/reusable_widgets/helper_methods_and_attributes.dart';
// import 'package:audioplayers/audioplayers.dart';

class RadioTabScreen extends StatefulWidget {
  const RadioTabScreen({super.key});
  static const String routeName = "Radio_tab_screen"; // route name
  static const primaryColor = Color(0xffB7935F);

  @override
  State<RadioTabScreen> createState() => _RadioTabScreenState();
}

class _RadioTabScreenState extends State<RadioTabScreen> {
  int selectedItemIndex = 3;

  bool play = false;
  IconData playPauseIcon = Icons.play_arrow_rounded;

  setplayorpauseIcon() {
    if (play) {
      playPauseIcon = Icons.pause;
    } else {
      playPauseIcon = Icons.play_arrow_rounded;
    }
    setState(() {});
  }

//Radio player

  // late AudioPlayer _audioPlayer;

  // Future<void> palyRadiofromUrl() async {
  //   await _audioPlayer.play(UrlSource(
  //                             'https://www.mp3quran.net/api/v3/radios?language=ar'));
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _audioPlayer = AudioPlayer()
  //     ..setUrl("https://mp3quran.net/api/v3/radios?language=ar");
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("assets/images/background_image.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "الراديو",
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

          // The Body :

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/radio_image.png", //Radio IMAGE
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "إذاعة القرآن الكريم",
                  style: GoogleFonts.elMessiri(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          //switch the next Quran radio station
                        },
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 40,
                        ),
                        color: RadioTabScreen.primaryColor),
                    IconButton(
                      onPressed: () {
                        play = !play;
                        setplayorpauseIcon();
                        if (play) {
                          //play the Quran radio station
                          // palyRadiofromUrl();
                        } else {
                          //pause the Quran radio station
                          // _audioPlayer.pause();
                        }
                      },
                      icon: Icon(
                        playPauseIcon,
                        size: 60,
                        color: RadioTabScreen.primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //switch the next Quran radio station
                      },
                      icon: const Icon(
                        Icons.skip_next_rounded,
                        size: 40,
                      ),
                      color: RadioTabScreen.primaryColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
