import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int DiceNumberLeft = 4;
  int DiceNumberRight = 1;
  @override
  Widget build(BuildContext context) {

    return Row(

      children: <Widget>[
        Expanded(
          child: FlatButton(
            child: Image.asset('images/dice$DiceNumberLeft.png'),
            onPressed: () {
              setState(() {
                DiceNumberLeft = Random().nextInt(6) + 1;
              });
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            child: Image.asset('images/dice$DiceNumberRight.png'),
            onPressed: () {
              setState(() {
                DiceNumberRight = Random().nextInt(6) + 1;
              });
            },
          ),
        ),
      ],
    );
  }
}
