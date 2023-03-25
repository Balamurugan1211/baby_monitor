import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile"),
        titleTextStyle: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
        centerTitle: true,
        backgroundColor: Colors.black54,
        elevation: 10,
      ),
      body: Center(
        child: Text("This is Profile Page"),
      ),
    );
    ;
  }
}
