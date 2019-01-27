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
  ui.Image _img;

  @override
  bool hitTest(HitTestResult result, { @required Offset position }) {
    return true;
  }

  _MyRenderBox() {
    loadAssetImage('image.jpg');
  }

  loadAssetImage(String fname) => rootBundle.load
    ("assets/$fname").then((bd) {
      Uint8List u8lst = Uint8List.view(bd.buffer);
      ui.instantiateImageCodec(u8lst).then((codec) {
        codec.getNextFrame().then(
            (frameInfo) {
              _img = frameInfo.image;
              markNeedsPaint();
              print("_img created: $_img");
            }
        );
      });
  });

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas c = context.canvas;
    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();

    c.save();
    c.clipRect(Rect.fromLTWH(dx + 75.0, dy + 75.0, 150.0, 150.0));

    Paint p = Paint();

    p.color = Color.fromARGB(150, 255, 0, 0);
    p.style = PaintingStyle.fill;
    Offset off = Offset(dx + 100.0, dy + 100.0);
    c.drawCircle(off, 50.0, p);
    p.color = Color.fromARGB(150, 0, 255, 0);
    off = Offset(dx + 150.0, dy + 150.0);
    c.drawCircle(off, 75.0, p);
    p.color = Color.fromARGB(150, 0, 0, 255);
    off = Offset(dx + 200.0, dy + 200.0);
    c.drawCircle(off, 100.0, p);

    c.restore();
  }
}
