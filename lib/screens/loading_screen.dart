import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    //Need to add persmission tags for ios & android to info.plist and AndroidManifest.xml files.
    Location location = Location();
    //Can only add await here if that method is returning a Future
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}