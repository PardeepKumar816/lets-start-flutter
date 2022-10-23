import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accelerometer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Accelerometer',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // color of the circle
  Color color = Colors.greenAccent;

  // event returned from accelerometer stream
  late AccelerometerEvent event;

  // hold a refernce to these, so that they can be disposed
  late Timer timer;
  late StreamSubscription accel;

  // positions and count
  double top = 125;
  late double left;
  int count = 0;

  // variables for screen size
  late double width;
  late double height;

  setColor(AccelerometerEvent event) {
    // Calculate Left
    double x = ((event.x * 12) + ((width - 100) / 2));
    // Calculate Top
    double y = event.y * 12 + 125;

    // find the difference from the target position
    var xDiff = x.abs() - ((width - 100) / 2);
    var yDiff = y.abs() - 125;

    // check if the circle is centered, currently allowing a buffer of 3 to make centering easier
    if (xDiff.abs() < 3 && yDiff.abs() < 3) {
      // set the color and increment count
      setState(() {
        color = Colors.greenAccent;
        count += 1;
      });
    } else {
      // set the color and restart count
      setState(() {
        color = Colors.red;
        count = 0;
      });
    }
  }

  setPosition(AccelerometerEvent event) {
    if (event == null) {
      return;
    }

    // When x = 0 it should be centered horizontally
    // The left positin should equal (width - 100) / 2
    // The greatest absolute value of x is 10, multipling it by 12 allows the left position to move a total of 120 in either direction.
    setState(() {
      left = ((event.x * 12) + ((width - 100) / 2));
    });

    // When y = 0 it should have a top position matching the target, which we set at 125
    setState(() {
      top = event.y * 12 + 125;
    });
  }

  startTimer() {
    // if the accelerometer subscription hasn't been created, go ahead and create it
    if (accel == null) {
      accel = accelerometerEvents.listen((AccelerometerEvent eve) {
        setState(() {
          event = eve;
        });
      });
    } else {
      // it has already ben created so just resume it
      accel.resume();
    }

    // Accelerometer events come faster than we need them so a timer is used to only proccess them every 200 milliseconds
    if (timer == null || !timer.isActive) {
      timer = Timer.periodic(Duration(milliseconds: 200), (_) {
        // if count has increased greater than 3 call pause timer to handle success
        if (count > 3) {
          pauseTimer();
        } else {
          // proccess the current event
          setColor(event);
          setPosition(event);
        }
      });
    }
  }

  pauseTimer() {
    // stop the timer and pause the accelerometer stream
    timer.cancel();
    accel.pause();

    // set the success color and reset the count
    setState(() {
      count = 0;
      color = Colors.green;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    accel?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // get the width and height of the screen
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Keep the circle in the center for 1 second'),
          ),
          Stack(
            children: [
              // This empty container is given a width and height to set the size of the stack
              Container(
                height: height / 2,
                width: width,
              ),

              // Create the outer target circle wrapped in a Position
              Positioned(
                // positioned 50 from the top of the stack
                // and centered horizontally, left = (ScreenWidth - Container width) / 2
                top: 50,
                left: (width - 250) / 2,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(125),
                  ),
                ),
              ),
              // This is the colored circle that will be moved by the accelerometer
              // the top and left are variables that will be set
              Positioned(
                top: top,
                left: left ?? (width - 100) / 2,
                // the container has a color and is wrappeed in a ClipOval to make it round
                child: ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: color,
                  ),
                ),
              ),
              // inner target circle wrapped in a Position
              Positioned(
                top: 125,
                left: (width - 100) / 2,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
          Text('x: ${(event?.x ?? 0).toStringAsFixed(3)}'),
          Text('y: ${(event?.y ?? 0).toStringAsFixed(3)}'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: startTimer,
              child: Text('Begin'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    color: Colors.white,
                  ))),
            ),
          )
        ],
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   double x = 0.0, y = 0.0, z = 0.0;
//   @override
//   void initstate() {
//     super.initState ();
//     userAccelerometerEvents.listen( (UserAccelerometerEvent event) {
//       setstate (0) 1
//       x = event.x;
//       y = event y;
//       z = event.z;
//     });
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
// class MyHomePageState extends State‹MyHomePage> {
//
// }
