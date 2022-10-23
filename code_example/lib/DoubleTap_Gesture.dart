import 'dart:math';

import 'package:flutter/material.dart';

class MyCardWidget extends StatefulWidget {
  const MyCardWidget({Key? key}) : super(key: key);

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  Color bgColor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
        });
      },
      child: Card(
        color: bgColor,
        child: const SizedBox(
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}

// class _MyCardWidgetState extends State<MyCardWidget> {
//
// @override Widget build(BuildContext context) {
// return
// }
