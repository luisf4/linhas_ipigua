// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class Alarmes extends StatefulWidget {
  const Alarmes({super.key});

  @override
  State<Alarmes> createState() => _AlarmesState();
}

class _AlarmesState extends State<Alarmes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter alarm clock example'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(25),
          child: TextButton(
            child: const Text(
              'Create alarm at 23:59',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              FlutterAlarmClock.createAlarm(10, 10, title: 'banana');
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          child: TextButton(
            child: const Text(
              'Show alarms',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              FlutterAlarmClock.showAlarms();
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          child: TextButton(
            child: const Text(
              'Create timer for 42 seconds',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              FlutterAlarmClock.createTimer(42);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          child: TextButton(
            child: const Text(
              'Show Timers',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              FlutterAlarmClock.showTimers();
            },
          ),
        ),
      ])),
    );
  }
}
