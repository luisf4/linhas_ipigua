// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Horarios extends StatelessWidget {
  final String banana;
  const Horarios(this.banana, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horarios linha"),
      ),
      body: Column(
        children: [Center(child: Text(banana))],
      ),
    );
  }
}
