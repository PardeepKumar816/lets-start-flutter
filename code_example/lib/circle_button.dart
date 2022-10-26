// it is a circle button which indicates the user about the page or screen he is on currently.

import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleButtonWithIndicator extends StatelessWidget {
  final Color buttonColor;
  final Color iconColor;
  final Color onBoardDotColor;
  final int pageNumber;
  final int totalPages;
  final void Function() onPressed;
  const CircleButtonWithIndicator({
    Key? key,
    required this.onPressed,
    required this.buttonColor,
    required this.iconColor,
    required this.onBoardDotColor,
    required this.pageNumber,
    required this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: CustomPageIndicator(
          activeColor: buttonColor,
          notActiveColor: onBoardDotColor,
          pageNumber: pageNumber,
          totalPages: totalPages,
          radius: MediaQuery.of(context).size.height * 0.155 / math.pi,
        ),
        child: MaterialButton(
          splashColor: buttonColor.withOpacity(0.5),
          color: buttonColor,
          height: MediaQuery.of(context).size.height * 0.085,
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Icon(
            size: 40,
            Icons.chevron_right,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

class CustomPageIndicator extends CustomPainter {
  final double radius;

  final int pageNumber;
  final int totalPages;
  final Color activeColor;
  final Color notActiveColor;

  CustomPageIndicator({
    required this.radius,
    required this.pageNumber,
    required this.totalPages,
    required this.activeColor,
    required this.notActiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    double angle = 2 * math.pi * ((pageNumber / totalPages) * 100 / 100);

    final paint = Paint()
      ..color = notActiveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    Paint animationArc = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);

    //180deg = pi, top of the circle is 270deg, so it will be pi*1.5.
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        math.pi * 1.5, angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

// usage example 

// CircleButtonWithIndicator(
//                   onPressed: () {
//                     
//                   },
//                   buttonColor: Colors.pink,
//                   iconColor: Colors.white,
//                   onBoardDotColor: Colors.grey,

//                   //cuz the array index will start from 0.
//                   pageNumber: 0, //this will dynamically change
//                   totalPages: pages.length, //length of total number of pages or screens
//                 )
