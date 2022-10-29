import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('I Am Useless'),
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/useless.png'),
          ),
        ),
      ),
    ),
  );
}
