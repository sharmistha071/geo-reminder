import 'dart:async';
import 'package:flutter/material.dart';


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
	// TODO Access location data here
	_AddTodoState(String lo){
		this.location = lo;
	}

  final locationController = new TextEditingController();
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();

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
		            // TODO: use onChanged method for catching the text .
		            //onChanged: ,
	            ),
            ),

	          new ListTile(
		          leading: new Icon(Icons.speaker_notes, color: Colors.redAccent),
		          title: new Text("Write your notes"),
	          ),

	          new Expanded(
			          child: new Card(
				          margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
				          child: new Padding(
					          padding: new EdgeInsets.all(8.0),
					          child: new TextField(
						          decoration: null,
						          //controller: _noteTextController,
						          autofocus: true,
						          maxLines: null,
						          //onChanged: (value) => _note = value,
					          ),
				          ),
			          )
	          ),
//            new Container(
//              child: new RaisedButton(
//                onPressed: () {
//									Navigator.of(context).pushNamed("/HomeScreen");
//								},
//                color: Colors.redAccent[400],
//                textColor: Colors.white,
//                child: new Text("Save")
//              ),
//              padding: const EdgeInsets.only(top: 30.0),
//            ),
          ]
        )
      ),
    );
  }

}
