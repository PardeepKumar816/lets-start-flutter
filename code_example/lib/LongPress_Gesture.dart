import 'package:flutter/material.dart';

class MyCardWidget extends StatefulWidget {
  const MyCardWidget({Key? key}) : super(key: key);

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  Color bgColor = Colors.yellow;
  bool makeCircular = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          makeCircular = !makeCircular;
        });
      },
      child: Card(
        shape: makeCircular
            ? const CircleBorder()
            : const RoundedRectangleBorder(),
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
// }
