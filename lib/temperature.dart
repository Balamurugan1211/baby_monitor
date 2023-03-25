import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:video_player/video_player.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final url = "http://192.168.109.166:8080";
  double temp = 0;

  void getdata() async {
    try {
      final response = await get(Uri.parse(url));
      final res = response.body;
      print(res);

      setState(() {
        temp = double.parse(res);
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    dynamic color;
    var mood;
    if (temp <= 90) {
      color = Colors.green;
      mood = 'assets/happy.gif';
    } else {
      color = Colors.red;
      mood = 'assets/sad.gif';
    }

    getdata();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Temperature"),
          titleTextStyle: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
          centerTitle: true,
          backgroundColor: Colors.black54,
          elevation: 10,
        ),
        body: Stack(
          children: [
            Image(
              image: AssetImage(mood),
              height: height,
              width: width,
              fit: BoxFit.fill,
            ),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 13, horizontal: width * 0.05),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.425,
                        height: height * 0.11,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Average Temperature",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: Text(
                                "🌡65.5°C",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Container(
                        width: width * 0.425,
                        height: height * 0.11,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Status",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Normal",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SfRadialGauge(
                      enableLoadingAnimation: true,
                      animationDuration: 1000,
                      axes: [
                        RadialAxis(
                          minimum: 40,
                          maximum: 150,
                          labelsPosition: ElementsPosition.outside,
                          majorTickStyle: MajorTickStyle(
                            length: 0,
                          ),
                          minorTickStyle: MinorTickStyle(
                            length: 0,
                          ),
                          pointers: [
                            MarkerPointer(
                              value: temp,
                              markerType: MarkerType.circle,
                              color: color,
                              enableAnimation: true,
                              animationDuration: 1000,
                            )
                          ],
                          axisLineStyle: AxisLineStyle(
                            cornerStyle: CornerStyle.bothCurve,
                            thickness: 2,
                          ),
                          annotations: [
                            GaugeAnnotation(
                              widget: Text(
                                temp.toString() + "°F",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                          ranges: [
                            GaugeRange(
                              startValue: 40,
                              endValue: temp,
                              color: color,
                              startWidth: 2,
                              endWidth: 2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.13,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("PREDICTION:",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          child: Text("The Baby Temperature will be normal.",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
} 