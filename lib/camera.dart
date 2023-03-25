import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Camera"),
        titleTextStyle: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
        centerTitle: true,
        backgroundColor: Colors.black54,
        elevation: 10,
      ),
      body: Center(
        child: Text("This is Camera Page"),
      ),
    );
    ;
  }
}
