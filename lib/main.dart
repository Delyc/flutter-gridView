import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView and GridView Example"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Item 1"),
                    subtitle: Text("Description for item 1"),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Item 2"),
                    subtitle: Text("Description for item 2"),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Item 3"),
                    subtitle: Text("Description for item 3"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        SizedBox(height: 10.0),
                        Text("Item 1"),
                        Text("Description for item 1"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        SizedBox(height: 10.0),
                        Text("Item 2"),
                        Text("Description for item 2"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        SizedBox(height: 10.0),
                        Text("Item 3"),
                        Text("Description for item 3"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
