import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';


class AddTodo extends StatefulWidget {
	String location;


	AddTodo(String s){
		this.location = s;
	}
	@override
	_AddTodoState createState() => new _AddTodoState(this.location);

}

class _AddTodoState extends State<AddTodo> {

	  String location;
		String title;
		String description;
		double lat;
		double long;
		List<Item> items = new List();
		Item item;
		DatabaseReference itemRef;

	// TODO Access location data here
	_AddTodoState(String lo){
		this.location = lo;
	}

  final locationController = new TextEditingController();
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();

	@override
	DatabaseReference keepReference = FirebaseDatabase.instance.reference().child('habijabi');
	void handleSubmit(String loc, String title, String desc) {
		Map data = {
			"loc": loc,
			"title": title,
			"desc": desc
		};
		keepReference.push().set(data);
	}

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add Todo'),
        backgroundColor: Colors.redAccent[400],
	      actions: <Widget>[
					new IconButton(
							icon: new Icon(Icons.save),
							iconSize: 30.0,
							onPressed: (){
								Navigator.of(context).pushNamed("/HomeScreen");
							}
					)
	      ],
      ),

      body: new Container(
        padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
        child: new Column(
          children: <Widget>[
          	new ListTile(
		          leading: new Icon(Icons.location_on, color: Colors.redAccent,),
		          title: new Text("${this.location}"),
	          ),
            new ListTile(
	            leading: new Icon(Icons.title),
	            title: new TextField(
		            controller: titleController,
		            decoration: new InputDecoration(
			            labelText: 'Title',
			            hintText: 'Enter your title'
		            ),
		            autocorrect: true,
		            autofocus: true,
		           	onChanged: (value) => title = value,
	            ),
            ),

	          new ListTile(
		          leading: new Icon(Icons.speaker_notes, color: Colors.redAccent),
		          //title: new Text("Write your notes"),
							title: new TextField(
		            controller: descriptionController,
		            decoration: new InputDecoration(
			            labelText: 'Note',
			            hintText: 'Write your Notes'
		            ),
		            autocorrect: true,
		            autofocus: true,
		            onChanged: (value) => description = value,
	            ),
	          ),

	          // new Expanded(
			      //     child: new Card(
				    //       margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
				    //       child: new Padding(
					  //         padding: new EdgeInsets.all(8.0),
					  //         child: new TextField(
						//           decoration: null,
						//           //controller: _noteTextController,
						//           autofocus: true,
						//           maxLines: null,
						//           //onChanged: (value) => _note = value,
					  //         ),
				    //       ),
			      //     )
	          // ),
           new Container(
             child: new RaisedButton(
               onPressed: () {
								 print('$location');
								 print('$title');
								 print('$description');
								 	handleSubmit(this.location, this.title, this.description);
									Navigator.of(context).pushNamed("/HomeScreen");
								},
               color: Colors.redAccent[400],
               textColor: Colors.white,
               child: new Text("Save")
             ),
             padding: const EdgeInsets.only(top: 30.0),
           ),
          ]
        )
      ),
    );
  }

}

final FirebaseApp app = FirebaseApp(
	options: FirebaseOptions(
		googleAppID: '1:600403879987:android:aed11748d8f44563',
		apiKey: 'AIzaSyCfhvb4P23rGUaWG6CdTPn80Eg7izIAbmQ',
		databaseURL: 'https://geo-remainder-1524648633654.firebaseio.com'
	)
);
