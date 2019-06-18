import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  Random _rand = Random();
  Color _color = Colors.white;
  String _str = 'Tap the screen to change background color';

  void colorChnage() {
    setState(() {
      var list = [
        _rand.nextInt(256),
        _rand.nextInt(256),
        _rand.nextInt(256),
        _rand.nextInt(256)
      ];

      _color = Color.fromARGB(
        list[0],
        list[1],
        list[2],
        list[3],
      );
      _str = 'Hey there';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text(
              'Welcome',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
              color: _color,
              child: new InkWell(
                child: new Align(
                    alignment: Alignment.center,
                    child: Text(
                      _str,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, foreground: Paint()..shader = linearGradient),
                    )),
                onTap: colorChnage,
              ))),
    );
  }

  final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.pink, Colors.blueGrey],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
