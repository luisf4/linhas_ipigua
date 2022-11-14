// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class Horarios extends StatelessWidget {
  final String cidade;
  final String preco;
  final int tempo;
  final List sas;
  final List sab;
  final List dom;

  Horarios(this.cidade, this.preco, this.tempo, this.sas, this.sab, this.dom,
      {super.key});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cidade),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Segunda a Sexta-Feira"),
                  ),
                  SizedBox(
                    height: 50,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sas.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(sas[index])),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sabado"),
                  ),
                  SizedBox(
                    height: 50,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sab.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(sab[index])),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Domingo"),
                  ),
                  SizedBox(
                    height: 50,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dom.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(dom[index])),
                          );
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // Create an alarm at 23:59
                        FlutterAlarmClock.createAlarm(15, 19);
                      },
                      child: Text('data'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
