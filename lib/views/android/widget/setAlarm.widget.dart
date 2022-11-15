// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SetAlarm extends StatelessWidget {
  const SetAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set alarm"),
      ),
      body: Column(
        children: [
          Text('data'),
          ElevatedButton(
            onPressed: () {},
            child: Text("Set Alarm"),
          ),
        ],
      ),
    );
  }
}
