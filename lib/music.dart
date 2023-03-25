import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Music"),
        titleTextStyle: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
        centerTitle: true,
        backgroundColor: Colors.black54,
        elevation: 10,
      ),
      body: Center(
        child: Text("This is Music Page"),
      ),
    );
    ;
  }
}
