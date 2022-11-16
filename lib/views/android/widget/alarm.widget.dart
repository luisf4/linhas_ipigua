// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
        title: Text(
          "Alarms",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [Text('aaa')]),
        ),
      ),
    );
  }
}
