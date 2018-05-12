import 'package:flutter/material.dart';

import 'main.dart';
import 'models.dart';
import 'place.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  /*.................main widget........................*/
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List'),
        backgroundColor: Colors.redAccent[400],
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
									decoration: new BoxDecoration(color: Colors.redAccent[400]),
							),
							new Divider(color: Colors.white,),
						],
					)
			),
      body: new Container(
        child: new ListView.builder(itemBuilder: _itemBuilder),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        backgroundColor: Colors.redAccent[400],
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new CustomSearchScaffold()),
          );
        },
      ),
    );
  }
/*.................end main widget........................*/

  Widget _itemBuilder(BuildContext context, int index){
    Todo todo = getTodo(index);
    return new TodoItemWidget(todo: todo);
  }

  Todo getTodo(int index){
    return new Todo(false, 'todo $index, Dhaka, Bangladesh');
  }
}

class TodoItemWidget extends StatefulWidget{
  TodoItemWidget({Key key, this.todo }) : super(key:key);

  final Todo todo;

  @override
  _TodoItemWidgetState createState() => new _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget>{
  bool _isChecked = false;
  void onChanged(bool value){
    setState((){
      _isChecked = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new ListTile(
      leading: new Checkbox(
        value: _isChecked,
        onChanged: (bool newValue) {
          setState(() {
            _isChecked = newValue;
          });
        },
      ),
      title: new Text(widget.todo.name),
    );
  }
}
