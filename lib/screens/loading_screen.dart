import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_clima/location.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Position _currentPosition;

  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  // void getLocation() async {
  //   Position _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  //   print(_currentPosition);
  // }
  //
  void _getCurrentLocation() async{
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);

      });


    }).catchError((e) {
      print(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print('Button Pressed');
            _getCurrentLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
