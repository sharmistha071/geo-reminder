import 'dart:async';
import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'place.dart';
import 'addTodo.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen(),
      '/CustomSearchScaffold': (BuildContext context) => new CustomSearchScaffold(),
      '/addTodo': (BuildContext context) => new AddTodo(),
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/map.png');
    var image = new Image(image: assetsImage, width:100.0);
    return new Scaffold(
      backgroundColor: Colors.redAccent[400],

      body: new Center(
        child: image,
      ),
    );
  }
}
