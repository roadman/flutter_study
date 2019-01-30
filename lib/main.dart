import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


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
//      home: new FirstScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => new _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {
  final _controller = TextEditingController();
  final _fname = 'mydata.txt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          Text('Home Screen',
            style: TextStyle(
              color: Colors.red,
            )
          ),
          Padding( padding: EdgeInsets.all(20.0) ),
          TextField(
            maxLength: 5,
            controller: _controller,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () => setState(() {
          loadIt().then((String value) {
            setState(() {
              _controller.text = value;
            });
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text("loaded!"),
                content: Text("load message from Asset."),
              )
            );
          });
        })
      ),
    );
  }

  Future<String> getDataAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> loadIt() async {
    try {
      return await getDataAsset(_fname);
    } catch (e) {
      return null;
    }
  }
}

