import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/Themes/mythemedata.dart';
import 'package:islamiapp/providers/app_config_provider.dart';
import 'package:islamiapp/reusable_widgets/helper_methods_and_attributes.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/screens/settings_tab_screen.dart';
import 'package:provider/provider.dart';

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
            var provider = Provider.of<AppConfigProvider>(context);
    SettingsTabScreen.setBackgoroundImage(provider);
    
    return Stack(
      children: <Widget>[
        MyThemeData.appbackgroundimage,
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.radio,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
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
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(
                          "assets/images/quran_tab_images/quran_icon.png"),
                      size: 62,
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/images/quran_tab_images/sebha.png"),
                      size: 62,
                    ),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/images/quran_tab_images/hadieth.png"),
                      size: 62,
                    ),
                    label: AppLocalizations.of(context)!.hadieth),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage("assets/images/quran_tab_images/radio.png"),
                      size: 62,
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  label: AppLocalizations.of(context)!.settings,
                ),
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
                  AppLocalizations.of(context)!.quran_kareem_radio,
                  style: GoogleFonts.elMessiri(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  textDirection: TextDirection.ltr,
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
