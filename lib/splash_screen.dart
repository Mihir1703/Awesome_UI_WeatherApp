import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'networking.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:awesome_climate_app/home.dart';
import 'dart:io';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    navigateHome();
  }
  void getWeatherData(int lat,int lon) async {
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=5b8181b7ac6ee3715ca04a8a2f25b230');
    Response response = await get(url);
    Map data = json.decode(response.body);
    if(response.statusCode == 200){
      Response response2 = await get(Uri.parse('https://ipinfo.io/json'));
      Map data2 = json.decode(response2.body);
      double temp = data['main']['temp'] - 273.15;
      String weather = data['weather'][0]['description'];
      int pressure = data['main']['pressure'];
      double wind = 3.6*data['wind']['speed'];
      int humidity = data['main']['humidity'];
      String varyIcon = data['weather'][0]['main'];
      String city = "${data2['city']} ,${data2['region']}";
      await Future.delayed(const Duration(milliseconds: 500),(){});
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(
        temperature: temp.toStringAsFixed(1),
        weather: weather,
        pressure: pressure.toStringAsFixed(2),
        wind: wind.toStringAsFixed(2),
        humidity: humidity.toStringAsFixed(1),
        city: city,
        varyIcon: varyIcon,
      )));
    }else{
      exit(0);
    }
  }
  void navigateHome() async{
    Position position = await determinePosition();
    getWeatherData(position.latitude.toInt(), position.longitude.toInt());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 50.0,
                      child: Icon(
                        Icons.cloud,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Please wait while we fetch information for your location, make sure to allow location access.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}