import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

Row bottomFields(String title, String value, FaIcon showIcon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      CircleAvatar(
        backgroundColor: const Color(0xFFDEDEDE),
        radius: 25.0,
        child: showIcon,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xEAA3A3A3),
              ),
            ),
            Text(
              value,
              style: GoogleFonts.recursive(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      )
    ],
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String temperature = 30.toString();
  late String weather = "Mostly Clouds";
  late String precipitation = 50.toString();
  late String wind = "10";
  late String humidity = "89";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9DECC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Indore, Madhya Pradesh",
                            style: GoogleFonts.rye(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          Text(
                            "Today, December 25 15:05",
                            style: GoogleFonts.sourceSansPro(
                                color: const Color(0xFF474747),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.cloudSun,
                                color: Colors.black,
                                size: 40,
                              ),
                              Text(
                                weather,
                                style: GoogleFonts.recursive(fontSize: 15),
                              )
                            ],
                          ),
                          Text(
                            "$temperature°",
                            style: const TextStyle(fontSize: 60,color: Color(
                                0xFF284B87)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SvgPicture.asset('assets/svg/day.svg',height: 150,)
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 9,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),

                ),
                height: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Weather Now",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.recursive(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          bottomFields(
                              "Feels like",
                              "$temperature°",
                              const FaIcon(
                                FontAwesomeIcons.temperatureLow,
                                color: Colors.black,
                              )),
                          bottomFields(
                              "Wind",
                              "$wind km/h",
                              const FaIcon(
                                FontAwesomeIcons.wind,
                                color: Colors.black,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          bottomFields(
                              "Precipitation",
                              "$precipitation%",
                              const FaIcon(
                                FontAwesomeIcons.umbrellaBeach,
                                color: Colors.black,
                              )),
                          bottomFields(
                              "Humidity",
                              "$humidity%",
                              const FaIcon(
                                FontAwesomeIcons.tint,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}