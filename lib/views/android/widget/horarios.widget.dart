// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Horarios extends StatefulWidget {
  final String document;
  const Horarios(this.document, {super.key});

  @override
  State<Horarios> createState() => _HorariosState();
}

class _HorariosState extends State<Horarios> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horarios"),
        actions: [
          Padding(
            padding: EdgeInsets.all(11.0),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.person, size: 25)),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
              child: Column(
            children: [
              Text('a'),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
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
                      Icons.alarm_add,
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
