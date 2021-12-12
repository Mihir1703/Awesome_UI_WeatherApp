import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'networking.dart';

Widget decideSvg(String icon) {
  if (icon == 'Haze') {
    return const FaIcon(
      FontAwesomeIcons.smog,
      color: Colors.black,
      size: 40,
    );
  }
  if (DateTime.now().hour >= 18) {
    if (icon == 'Cloudy') {
      return const FaIcon(
        FontAwesomeIcons.cloudSun,
        color: Colors.black,
        size: 40,
      );
    } else if (icon == 'Clear') {
      return const FaIcon(
        FontAwesomeIcons.sun,
        color: Colors.black,
        size: 40,
      );
    } else {
      return const FaIcon(
        FontAwesomeIcons.cloud,
        color: Colors.black,
        size: 40,
      );
    }
  }
  if (icon == 'Cloudy') {
    return const FaIcon(
      FontAwesomeIcons.cloudMoon,
      color: Colors.black,
      size: 40,
    );
  } else if (icon == 'Clear') {
    return const FaIcon(
      FontAwesomeIcons.moon,
      color: Colors.black,
      size: 40,
    );
  }
  return const FaIcon(
    FontAwesomeIcons.cloud,
    color: Colors.black,
    size: 40,
  );
}

Row bottomFields(String title, String value, FaIcon showIcon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: const Color(0xFFDEDEDE),
        radius: 25.0,
        child: showIcon,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
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
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      )
    ],
  );
}

Row bottomFieldsRight(String title, String value, FaIcon showIcon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
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
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      CircleAvatar(
        backgroundColor: const Color(0xFFDEDEDE),
        radius: 25.0,
        child: showIcon,
      ),
    ],
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {required this.temperature,
      required this.weather,
      required this.pressure,
      required this.wind,
      required this.humidity,
      required this.city,
      required this.varyIcon});
  late String varyIcon;
  String temperature = 30.toString();
  String weather = "Mostly Clouds";
  String pressure = 50.toString();
  String wind = "10";
  String humidity = "89";
  late String city;
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9DECC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.city,
                            style: GoogleFonts.rye(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          Text(
                            getDateFormatted(),
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
                              decideSvg(widget.varyIcon),
                              Text(
                                widget.weather,
                                style: GoogleFonts.recursive(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Text(
                            "${widget.temperature}°",
                            style: const TextStyle(
                                fontSize: 60, color: Color(0xFF284B87)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SvgPicture.asset(
                        'assets/svg/front.svg',
                        height: 150,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: bottomFields(
                                "Feels like",
                                "${widget.temperature}°",
                                const FaIcon(
                                  FontAwesomeIcons.temperatureLow,
                                  color: Colors.black,
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: bottomFieldsRight(
                                "Wind",
                                "${widget.wind}km/h",
                                const FaIcon(
                                  FontAwesomeIcons.wind,
                                  color: Colors.black,
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: bottomFields(
                                "Pressure",
                                widget.pressure,
                                const FaIcon(
                                  FontAwesomeIcons.umbrellaBeach,
                                  color: Colors.black,
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: bottomFieldsRight(
                                "Humidity",
                                "${widget.humidity}%",
                                const FaIcon(
                                  FontAwesomeIcons.tint,
                                  color: Colors.black,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
