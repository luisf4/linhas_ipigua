// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/models/notificationn.moldel.dart';

class SetAlarm extends StatelessWidget {
  final String horario;
  const SetAlarm({super.key, required this.horario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set alarm"),
      ),
      body: Column(
        children: [
          Text(horario),
          ElevatedButton(
            onPressed: () => NotificationApi.showNotification(
              title: "banana",
              body: "fafofafafafa",
              payload: 'danone.bas',
            ),
            child: Text("Set Alarm"),
          ),
        ],
      ),
    );
  }
}
