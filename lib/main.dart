import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body:
      new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: Container(
                color: Colors.red,
                child: Text("First item"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
            ),
            new Expanded(
              child: Padding(
                padding: EdgeInsets.all(25.0),
              child: Container(
                color: Colors.blue,
                child: Text("Second item"),
              ),
              ),
            ),
            new Expanded(
              child: Container(
                color: Colors.green,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text("Theard item"),
              ),
              ),
            )
          ]

      ),

    );
  }
}