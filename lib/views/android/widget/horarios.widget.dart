// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';

class Horarios extends StatelessWidget {
  final String cidade;
  final List sas;
  const Horarios(this.cidade, this.sas, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horarios linha"),
      ),
      body: Column(
        children: [
          Center(
              child: Column(
            children: [],
          ))
        ],
      ),
    );
  }
}
