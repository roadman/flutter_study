import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';

import 'dart:typed_data';
import 'dart:async';
import 'dart:ui' as ui;

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
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: Center(
        child: MyRenderBoxWidget(),
      ),
    );
  }
}

class MyRenderBoxWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MyRenderBox();
  }
}

class _MyRenderBox extends RenderBox {
  @override
  bool hitTest(HitTestResult result, { @required Offset position}) {
    return true;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas c = context.canvas;

    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 200, 0, 255);
    Rect r = Rect.fromLTWH(dx + 50.0, dy + 50.0, 150.0, 150.0);
    c.drawRect(r, p);

    p.style = PaintingStyle.stroke;
    p.color = Colors.red;
    p.strokeWidth = 10.0;
    r = Rect.fromLTWH(dx + 100.0, dy + 100.0, 150.0, 150.0);
    c.drawRect(r, p);

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 0, 200, 255);
    Offset ctr = Offset(dx + 100.0, dy + 400.0);
    c.drawCircle(ctr, 75.0, p);

    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;
    r = Rect.fromLTWH(dx + 100.0, dy + 350.0, 200.0, 150.0);
    c.drawOval(r, p);

    r = Rect.fromLTWH(dx + 50.0, dy + 400.0, 150.0, 200.0);
    c.drawOval(r, p);
  }
}
