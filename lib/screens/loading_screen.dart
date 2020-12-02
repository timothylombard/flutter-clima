import 'package:flutter/material.dart';
import 'package:flutter_clima/services/location.dart';
import 'package:flutter_clima/services/networking.dart';

const apiKey = 'd7485d61229ce54a64284ef4a91f22af';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';



class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return _LoadingScreenState();}
}


class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;



  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();



  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print(latitude);
            print(longitude);
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
