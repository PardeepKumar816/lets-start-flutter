import 'package:flutter/material.dart';
import 'dart:async';

import 'package:environment_sensors/environment_sensors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _tempAvailable = false;
  bool _humidityAvailable = false;
  bool _lightAvailable = false;
  bool _pressureAvailable = false;
  final environmentSensors = EnvironmentSensors();

  @override
  void initState() {
    super.initState();
    environmentSensors.pressure.listen((pressure) {
      print(pressure.toString());
    });
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool tempAvailable;
    bool humidityAvailable;
    bool lightAvailable;
    bool pressureAvailable;

    tempAvailable = await environmentSensors
        .getSensorAvailable(SensorType.AmbientTemperature);
    humidityAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Humidity);
    lightAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Light);
    pressureAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Pressure);

    setState(() {
      _tempAvailable = tempAvailable;
      _humidityAvailable = humidityAvailable;
      _lightAvailable = lightAvailable;
      _pressureAvailable = pressureAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Environment Sensors'),
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            (_tempAvailable)
                ? StreamBuilder<double>(
                    stream: environmentSensors.humidity,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return const CircularProgressIndicator();
                      return Text(
                          'The Current Humidity is: ${snapshot.data?.toStringAsFixed(2)}%');
                    })
                : const Text('No relative humidity sensor found'),
            (_humidityAvailable)
                ? StreamBuilder<double>(
                    stream: environmentSensors.temperature,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return Text(
                          'The Current Temperature is: ${snapshot.data?.toStringAsFixed(2)}');
                    })
                : const Text('No temperature sensor found'),
            (_lightAvailable)
                ? StreamBuilder<double>(
                    stream: environmentSensors.light,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return Text(
                          'The Current Light is: ${snapshot.data?.toStringAsFixed(2)}');
                    })
                : const Text('No light sensor found'),
            (_pressureAvailable)
                ? StreamBuilder<double>(
                    stream: environmentSensors.pressure,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return Text(
                          'The Current Pressure is: ${snapshot.data?.toStringAsFixed(2)}');
                    })
                : const Text('No pressure sensure found'),
            //ElevatedButton(onPressed: initPlatformState , child: Text('Get'))
          ])),
    );
  }
}
