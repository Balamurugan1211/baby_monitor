import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Swing extends StatefulWidget {
  const Swing({Key? key}) : super(key: key);

  @override
  State<Swing> createState() => _SwingState();
}

class _SwingState extends State<Swing> {
  bool click = false;
  final url = "http://192.168.109.166:8080/app";
  String pos = "OFF";
  var indes;

  void postData() async {
    try {
      final response = await post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "swingpos": pos,
          "speed": indes.toString(),
        }),
      );
      print(response.body);
    } catch (er) {}
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var swingpos;

    if (click == false) {
      pos = "OFF";
      swingpos = 'assets/swingcradle.jpg';
      indes = null;
    } else {
      pos = "ON";
      swingpos = 'assets/swingcradle.gif';
    }
    postData();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Swing"),
          titleTextStyle: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
          centerTitle: true,
          backgroundColor: Colors.black54,
          elevation: 10,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image(
                  image: AssetImage(swingpos),
                  height: height * 0.88,
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  height: height * 0.88,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.03),
                      child: Column(
                        children: [
                          Container(
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.07,
                                            vertical: height * 0.03)),
                                    Text(
                                      "Swing Position:",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Text(
                                      pos,
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.08),
                            child: Container(
                                height: width * 0.3,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: Colors.white),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        click = !click;
                                      });
                                    },
                                    icon: Image.asset((click == false)
                                        ? 'assets/poweron.png'
                                        : 'assets/poweroff.png'))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Container(
                          width: width * 0.9,
                          height: height * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.01),
                                child: Text(
                                  "SETTINGS",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.06,
                                    vertical: height * 0.02),
                                child: Row(
                                  children: [
                                    Text(
                                      "SPEED:",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    ToggleSwitch(
                                      minWidth: width * 0.17,
                                      minHeight: height * 0.05,
                                      cornerRadius: 10.0,
                                      initialLabelIndex: indes,
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 3,
                                      icons: [
                                        Icons.looks_one_outlined,
                                        Icons.looks_two_outlined,
                                        Icons.looks_3_outlined
                                      ],
                                      iconSize: 30.0,
                                      borderWidth: 2.0,
                                      borderColor: [Colors.blueGrey],
                                      activeBgColor: [Colors.blue],
                                      changeOnTap: (pos == "ON") ? true : false,
                                      onToggle: (index) {
                                        indes = index;
                                        postData();
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.05,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "TIMER:",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    SizedBox(
                                      width: width * 0.12,
                                      height: width * 0.12,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "MM"),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    SizedBox(
                                      width: width * 0.12,
                                      height: width * 0.12,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "MM"),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04,
                                    vertical: height * 0.02),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "RESET",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontStyle: FontStyle.normal),
                                        )),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "CANCEL",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontStyle: FontStyle.normal),
                                        )),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "SET",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontStyle: FontStyle.normal),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
