import 'package:flutter/material.dart';
import 'package:islamiapp/screens/quran_tab_screen.dart';
import 'package:islamiapp/screens/sebhaa_tab_screen.dart';

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
      theme: ThemeData(
        // Add the line below to get horizontal sliding transitions for routes.
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routes: {
        QuranTabScreen.routeName: (context) => const QuranTabScreen(),
        SebhaaTabScreen.routeName: (context) => const SebhaaTabScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
