import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HomeScreen'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(30.0), // padding for child element
        //child: new Text('Welcome to Home.!'), // child of container
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text('Deliver features faster', textAlign: TextAlign.center),
                ),
                new Expanded(
                  child: new Text('Craft beautiful UIs', textAlign: TextAlign.center),
                ),
                new Expanded(
                  child: new FittedBox(
                    fit: BoxFit.contain, // otherwise the logo will be tiny
                    child: const FlutterLogo(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
