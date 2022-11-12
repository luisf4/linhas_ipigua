// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/widget/alarm.widget.dart';
import 'package:linhas_ipigua/views/android/widget/horarios.widget.dart';
import 'package:linhas_ipigua/views/android/widget/profile.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
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
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('linhas').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) return Text(snapshot.error.toString());

                var documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (_, index) {
                    var document = documents[index];
                    return ListTile(
                      leading: Icon(Icons.bus_alert_rounded),
                      title: Text(document['cidade']),
                      subtitle: Text('Preço R\$ ' + document['preco']),
                      trailing: Text(document['tempo'].toString() + " Minutos"),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Horarios('a'),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
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
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Alarmes(),
                      ),
                    ),
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

// class Documento {
//   final int id;
//   final String cidade;
//   final String preco;
//   final int tempo;
//   final List sas;
//   final List sab;
//   final List dom;

//   const Documento({
//     required this.id,
//     required this.cidade,
//     required this.preco,
//     required this.tempo,
//     required this.sas,
//     required this.sab,
//     required this.dom,
//   });
// }
