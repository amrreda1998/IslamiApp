import 'package:flutter/material.dart';
import 'package:islamiapp/Themes/mythemedata.dart';
import 'package:islamiapp/providers/app_config_provider.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/reusable_widgets/helper_methods_and_attributes.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsTabScreen extends StatefulWidget {
  const SettingsTabScreen({super.key});
  static const String routeName = "Settings_tab_screen"; // route name
  static const primaryColor = Color(0xffB7935F);

  static String? choosenTheme = "Light Theme";
  static String? choosenlanguage = "English";

  static setBackgoroundImage(AppConfigProvider provider) {
    if (provider.isDark()) {
      MyThemeData.appbackgroundimage =
          Image.asset("assets/images/background_image_dark.png");
    } else {
      MyThemeData.appbackgroundimage =
          Image.asset("assets/images/background_image.png");
    }
  }

  @override
  State<SettingsTabScreen> createState() => _SettingsTabScreen();
}

class _SettingsTabScreen extends State<SettingsTabScreen> {
  int selectedItemIndex = 4;

  final List<String> languages = [
    "English",
    'Arabic',
  ];

  final List<String> themes = [
    "Light Theme",
    'Dark Theme',
  ];

  //function to map item to language using the loclization in the dropmenu

  String get_dropmenu_lang_item(String item) {
    if (item == "English") {
      item = AppLocalizations.of(context)!.english_language;
    } else {
      item = AppLocalizations.of(context)!.arabic_language;
    }
    return item;
  }

  String get_dropmenu_theme_item(String item) {
    if (item == "Light Theme") {
      item = AppLocalizations.of(context)!.light_theme;
    } else {
      item = AppLocalizations.of(context)!.dark_theme;
    }
    return item;
  }

  setChoosenTheme() {}

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    SettingsTabScreen.setBackgoroundImage(provider);

    return Stack(
      children: <Widget>[
        MyThemeData.appbackgroundimage,
        Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.settings,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            // centerTitle: true,
            // backgroundColor: Colors.transparent,
            // shadowColor: Colors.transparent,
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
              Center(
                child: Text(
                  "${AppLocalizations.of(context)!.choose_app_language} : ",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              //Language Drop menu
              //----------------------------
              Container(
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: SettingsTabScreen.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    items: languages
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                get_dropmenu_lang_item(item),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                        .toList(),
                    value: SettingsTabScreen.choosenlanguage,
                    onChanged: (String? value) {
                      setState(() {
                        SettingsTabScreen.choosenlanguage = value;
                      });
                      if (value == "Arabic" || value == "العربية") {
                        provider.changeLanguage("ar");
                        //saving app language
                        () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              "lastUsedProviderlanguage", provider.appLanguage);
                          sharedPreferences.setString(
                              "lastChoosenlanguage", value!);
                        }();
                      } else if (value == "English" || value == "الإنجليزية") {
                        provider.changeLanguage("en");
                        //saving app language
                        () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              "lastUsedProviderlanguage", provider.appLanguage);
                          sharedPreferences.setString(
                              "lastChoosenlanguage", value!);
                        }();
                      }
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 150,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                  ),
                ),
              ),

              //Themeing choosing
              Text(
                "${AppLocalizations.of(context)!.choose_app_theme} : ",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              //theming drop menu
              Container(
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: SettingsTabScreen.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    items: themes
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                get_dropmenu_theme_item(item),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                        .toList(),
                    value: SettingsTabScreen.choosenTheme,
                    onChanged: (String? value) {
                      setState(() {
                        SettingsTabScreen.choosenTheme = value;
                        if (value == "Light Theme" ||
                            value == "الوضع النهارى") {
                          provider.changeTheme(ThemeMode.light);
                          MyThemeData.appbackgroundimage =
                              Image.asset("assets/images/background_image.png");

                          // saving prefrences
                          () async {
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setBool(
                                "lastUsedthememode", true);
                            sharedPreferences.setString(
                                "lastChoosenTheme", value!);
                          }();
                        } else if (value == "Dark Theme" ||
                            value == "الوضع الليلى") {
                          provider.changeTheme(ThemeMode.dark);
                          MyThemeData.appbackgroundimage = Image.asset(
                              "assets/images/background_image_dark.png");

                          // saving prefrences
                          () async {
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setBool(
                                "lastUsedthememode", false);
                            sharedPreferences.setString(
                                "lastChoosenTheme", value!);
                          }();
                        }
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 170,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
