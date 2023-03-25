import 'package:baby_monitor/constant.dart';
import 'package:baby_monitor/splash_screen.dart';
import 'package:baby_monitor/temperature.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
