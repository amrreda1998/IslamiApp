import 'package:flutter/material.dart';
import 'package:islamiapp/Themes/mythemedata.dart';
import 'package:islamiapp/providers/app_config_provider.dart';
import 'package:islamiapp/screens/ahadieth_tab_screen.dart';
import 'package:islamiapp/screens/quran_tab_screen.dart';
import 'package:islamiapp/screens/radio_tab_screen.dart';
import 'package:islamiapp/screens/sebhaa_tab_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/screens/settings_tab_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => AppConfigProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //make a provider object of my language provider
    var provider = Provider.of<AppConfigProvider>(context);


    return MaterialApp(
      title: 'IslamiApp',
      initialRoute: QuranTabScreen.routeName,
      debugShowCheckedModeBanner: false,

      routes: {
        QuranTabScreen.routeName: (context) => const QuranTabScreen(),
        SebhaaTabScreen.routeName: (context) => const SebhaaTabScreen(),
        AhadiethTabScreen.routeName: (context) => const AhadiethTabScreen(),
        RadioTabScreen.routeName: (context) => const RadioTabScreen(),
        SettingsTabScreen.routeName: (context) => const SettingsTabScreen(),
      },
      //Localization
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.thememode,
      theme: MyThemeData.light_theme,
      darkTheme: MyThemeData.dark_theme,
    );
  }
}
