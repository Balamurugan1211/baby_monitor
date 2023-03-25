import 'package:baby_monitor/camera.dart';
import 'package:baby_monitor/profile.dart';
import 'package:baby_monitor/swing.dart';
import 'package:baby_monitor/temperature.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'music.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  final items = [
    Icon(Icons.bedroom_baby_outlined),
    Icon(Icons.music_note_outlined),
    Icon(Icons.thermostat_outlined),
    Icon(Icons.camera_alt),
    Icon(Icons.person)
  ];
  int selectedIndex = 0;
  final screen = [Swing(), Music(), Temperature(), Camera(), Profile()];

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          index: selectedIndex,
          items: items,
          animationDuration: Duration(milliseconds: 250),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          height: height * 0.07,
          backgroundColor: Colors.transparent,
          color: Colors.black54,
        ),
        body: screen[selectedIndex]);
  }
}
