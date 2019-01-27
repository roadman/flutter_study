import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';

import 'dart:typed_data';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math';

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
  void paint(PaintingContext context, Offset offset) {
    Canvas c = context.canvas;
    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();

    Path path = Path();
    Rect r = Rect.fromLTWH(dx + 50.0, dy + 50.0, 75.0, 75.0);
    path.addOval(r);
    r = Rect.fromLTWH(dx + 75.0, dy + 75.0, 125.0, 125.0);
    path.addOval(r);
    r = Rect.fromLTWH(dx + 125.0, dy + 125.0, 175.0, 175.0);
    path.addOval(r);

    Paint p = Paint();
    p.style = PaintingStyle.fill;

    c.save();
    c.clipPath(path);

    for (var i = 0; i < 100; i++) {
      Random rnd = Random();
      double w = rnd.nextInt(dx + 300).toDouble();
      double h = rnd.nextInt(dx + 300).toDouble();
      double cr = rnd.nextInt(50).toDouble();
      int r = rnd.nextInt(255);
      int g = rnd.nextInt(255);
      int b = rnd.nextInt(255);
      p.color = Color.fromARGB(50, r, g, b);
      c.drawCircle(Offset(w, h), cr, p);
    }

    c.restore();
  }
}
