import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  double _r = 0.0;
  double _g = 0.0;
  double _b = 0.0;

  @override
  void initState() {
    super.initState();
    loadPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        color: Color.fromARGB(200, _r.toInt(), _g.toInt(), _b.toInt()),
        child: Column(
          children: <Widget>[
            Text('Home Screen',
              style: TextStyle(
                color: Colors.red,
              )
            ),
            Padding( padding: EdgeInsets.all(20.0) ),
            TextField(
              controller: _controller,
            ),
            Padding( padding: EdgeInsets.all(20.0) ),
            Slider(
              min: 0.0,
              max: 255.0,
              value: _r,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  _r = value;
                });
              },
            ),
            Slider(
              min: 0.0,
              max: 255.0,
              value: _g,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  _g = value;
                });
              },
            ),
            Slider(
              min: 0.0,
              max: 255.0,
              value: _b,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  _b = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () => setState(() {
          savePref();
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text("loaded!"),
                content: Text("load message from Asset."),
              )
          );
        })
      ),
    );
  }

  void loadPref() async {
    SharedPreferences.getInstance().then(
      (SharedPreferences prefs) {
        setState(() {
          _r = (prefs.getDouble('r') ?? 0.0);
          _g = (prefs.getDouble('g') ?? 0.0);
          _b = (prefs.getDouble('b') ?? 0.0);
          _controller.text = (prefs.getString('input') ?? '');
        });
      }
    );
  }

  void savePref() async {
    SharedPreferences.getInstance().then(
      (SharedPreferences prefs) {
        setState(() {
          prefs.setDouble('r', _r);
          prefs.setDouble('g', _g);
          prefs.setDouble('b', _b);
          prefs.setString('input', _controller.text);
        });
      }
    );
  }

}

