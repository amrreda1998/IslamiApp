import 'package:flutter/material.dart';
import 'package:islamiapp/screens/ahadieth_tab_screen.dart';
import 'package:islamiapp/screens/quran_tab_screen.dart';
import 'package:islamiapp/screens/radio_tab_screen.dart';
import 'package:islamiapp/screens/sebhaa_tab_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IslamiApp',
      initialRoute: QuranTabScreen.routeName,
      theme: ThemeData(),

      routes: {
        QuranTabScreen.routeName: (context) => const QuranTabScreen(),
        SebhaaTabScreen.routeName: (context) => const SebhaaTabScreen(),
        AhadiethTabScreen.routeName: (context) => const AhadiethTabScreen(),
        RadioTabScreen.routeName: (context) => const RadioTabScreen()
      },
      //Localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // English
        Locale('en'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
