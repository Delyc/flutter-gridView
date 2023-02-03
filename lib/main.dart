import 'package:flutter/material.dart';

class Todo {
  Todo({required this.name, required this.checked}); // parameters are required 
  final String name; // this parameter is final and can't be changed only be set once
  bool checked;
}

class TodoItem extends StatelessWidget { // this stateless widget is used to display the todo item and it always have build because runs once and the properties those not change  
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;
  // the followig codes is showing the todo item and if it is checked then it will be crossed, 
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54, // this is the color of the text
      decoration: TextDecoration.lineThrough, // this is the decoration of the text 
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo); // this is the function that will be called when the todo item is clicked
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),  // this is the first letter of the todo item, will be in the circle Avatar
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)), // this is the name of the todo item with the function _getTextStyle that will deteminated if the todo item is checked or not and make affects
    );
  }
}

class TodoList extends StatefulWidget { // StatefulWidget is used to change the state of the widget
  @override
  _TodoListState createState() => new _TodoListState(); // create the state of the widget
}

class _TodoListState extends State<TodoList> { //
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[]; // creating the list of the todo items , the list is some kind of array

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo list'), // the title of the app
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0), // the padding of the list
        children: _todos.map((Todo todo) { // this is the list of the todo items
          return TodoItem(
            todo: todo, // the todo item
            onTodoChanged: _handleTodoChange, // the function that will be called when the todo item is clicked
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(), // the function that will be called when the floating button is clicked, and display the dialog
          tooltip: 'Add Item', // the tooltip of the floating button , this is like placeholder of the button
          child: Icon(Icons.add)), // the button icon
    );
  }

  void _handleTodoChange(Todo todo) { // this function will change checked property of the todo item when the user click on it 
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _addTodoItem(String name) { // this function will add the todo item to the list , and clear the text field(input)
    setState(() {
      _todos.add(Todo(name: name, checked: false)); // remember that the checked property is false by default and the name is required
    });
    _textFieldController.clear(); //clear the text field (input)
  }
  // this will be dialog for adding the new todo item
  Future<void> _displayDialog() async { // this function will display the dialog when the user click on the floating button
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField( // this is the text field (input)
            controller: _textFieldController, // this is like the value of the input
            decoration: const InputDecoration(hintText: 'Type your new todo'), // placeholder of the input
          ),
          actions: <Widget>[
            TextButton( // button to add todo item
              child: const Text('Add'), // the text of the button
              onPressed: () {
                Navigator.of(context).pop(); // this will close the dialog
                _addTodoItem(_textFieldController.text); // add the todo item to the list, by calling the function _addTodoItem
              },
            ),
          ],
        );
      },
    );
  }
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo list', 
      home: new TodoList(), 
    );
  }
}

void main() => runApp(new TodoApp());
