import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:baby_monitor/constant.dart';
import 'package:baby_monitor/temperature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      splash: Center(
        child: Image(image: AssetImage('assets/cradle.gif')),
      ),
      nextScreen: Home_screen(),
      backgroundColor: Colors.white,
      splashIconSize: height * 0.2,
      duration: 1500,
    );
  }
}
