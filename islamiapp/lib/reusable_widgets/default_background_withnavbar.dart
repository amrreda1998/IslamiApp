import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return(
      Stack(children: <Widget>[
      Image.asset("assets/images/background_image.png"),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Islami",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: const Color(0xffB7935F),
          ),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xff242424),
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/quran_tab_images/quran_icon.png"),
                    size: 62,
                  ),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/quran_tab_images/sebha.png"),
                    size: 62,
                  ),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/quran_tab_images/hadieth.png"),
                    size: 62,
                  ),
                  label: "Hadieth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/quran_tab_images/radio.png"),
                    size: 62,
                  ),
                  label: "Radio"),
            ],
          ),
        ),
      ),
    ]));
  }
}