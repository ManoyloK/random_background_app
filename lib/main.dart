import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rBg',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Random me completely!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color currentBgColor;
  Color newBgColor;
  Random _random = Random();
  Brightness brightness = Brightness.light;

  @override
  void initState() {
    super.initState();
    currentBgColor = Colors.yellow;
    newBgColor = _generateColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentBgColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: InkWell(
        onTap: _updateBackgroundColor,
        splashColor: newBgColor,
        child: Container(
          child: Center(
            child: Text(
              'Hey there',
              style: TextStyle(
                fontSize: 24,
                color: brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateBackgroundColor() {
    setState(() {
      currentBgColor = newBgColor;
      newBgColor = _generateColor();
      brightness = ThemeData.estimateBrightnessForColor(newBgColor);
    });
  }

  Color _generateColor() => Color.fromARGB(
        255,
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextInt(255),
      );
}
