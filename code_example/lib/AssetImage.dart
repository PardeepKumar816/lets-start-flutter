import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Showing a picture'),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/pic.jpg'),
        ),
      ),
    ),
  )
  );
}
