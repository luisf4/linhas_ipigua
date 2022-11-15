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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              NotificationService().cancelAllNotifications();
            },
            child: Container(
              height: 40,
              width: 200,
              color: Colors.red,
              child: Center(
                child: Text(
                  "Cancel All Notifications",
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              NotificationService().showNotification(1, "title", "body", 10);
            },
            child: Container(
              height: 40,
              width: 200,
              color: Colors.green,
              child: Center(
                child: Text("Show Notification"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
