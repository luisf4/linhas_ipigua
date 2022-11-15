// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:linhas_ipigua/views/android/widget/setAlarm.widget.dart';

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
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                    child:
                        Text("SEGUNDA A SEXTA", style: TextStyle(fontSize: 25)),
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
                            child: Center(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                child: Container(
                                  width: 65,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      sas[index],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                ),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SetAlarm(horario: sas[index]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
                    child: Text("SÁBADO", style: TextStyle(fontSize: 25)),
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
                            child: Center(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                child: Container(
                                  width: 65,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      sas[index],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                ),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SetAlarm(horario: sab[index]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
                    child: Text("DOMINGO", style: TextStyle(fontSize: 25)),
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
                            child: Center(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                child: Container(
                                  width: 65,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      dom[index],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                ),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SetAlarm(horario: dom[index]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
