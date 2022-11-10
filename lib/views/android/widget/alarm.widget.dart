// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/home.app.dart';
import 'package:linhas_ipigua/views/android/widget/profile.widget.dart';

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
        title: Text("Alarm Page"),
        actions: [
          Padding(
            padding: EdgeInsets.all(11.0),
            child: IconButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    ),
                icon: Icon(Icons.person, size: 25)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Text('Alarmes')),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.alarm_add_sharp,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
