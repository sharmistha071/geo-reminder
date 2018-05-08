import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';
import 'place.dart';

class AddTodo extends StatefulWidget {
	final String location;
	@override
	_AddTodoState createState() => new _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final locationController = new TextEditingController(text: 'Dhaka New Market, Bangladesh');
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add Todo'),
        backgroundColor: Colors.redAccent[400],
      ),

      body: new Container(
        padding: const EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new TextFormField(
              controller: locationController,
              decoration: new InputDecoration(
                labelText: 'Location',
                hintText: 'Dhaka, Bangladesh'
              ),
            ),
            new TextFormField(
              controller: titleController,
              decoration: new InputDecoration(
                labelText: 'Title'
              ),
            ),
            new TextFormField(
              controller: descriptionController,
              decoration: new InputDecoration(
                labelText: 'Description'
              ),
            ),
            new Container(
              child: new RaisedButton(
                onPressed: () {
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
