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
    print("load image.");
    loadAssetImage('image.jpg');
  }

  loadAssetImage(String fname) {
    print("call loadAssetImage");
    rootBundle.load
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
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas c = context.canvas;
    double dx = offset.dx + 30.0;
    double dy = offset.dy + 30.0;

    if (_img != null) {
      c.drawImage(_img, Offset(dx, dy), Paint());
      print("draw img.");
    } else {
      print("_img is null.");
    }

    Paint p = Paint();
    p.style = PaintingStyle.fill;

    p.blendMode = BlendMode.darken;

    for (var i = 0; i < 10; i++) {
      for (var j = 0; j < 10; j++) {
        p.color = Color.fromARGB(255, 25 * i, 0, 25 * i);
        Rect r = Rect.fromLTWH(dx + 30.0 * i, dy + 30.0 * j, 30.0, 30.0);
        c.drawOval(r, p);
      }
    }
  }
}
