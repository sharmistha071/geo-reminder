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
        backgroundColor: Colors.purple,
      ),
      // create sidebar menu
			drawer: new Drawer(
					child: new ListView(
						children: <Widget>[
							new UserAccountsDrawerHeader(
									accountName: new Text("User"),
									accountEmail: new Text("dummy@gmail.com"),
									currentAccountPicture: new CircleAvatar(
										backgroundColor: Colors.white,
										child: new Text('X'),
									),
									decoration: new BoxDecoration(color: Colors.purple),
							),
							new Divider(color: Colors.white,),
							// new ListTile(
							// 	title: new Text('Close', style: new TextStyle(color: Colors.white)),
							// 	trailing: new Icon(Icons.close, color: Colors.white,),
							// 	onTap: ()=> Navigator.of(context).pop(),
							// ),

						],
					)
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
