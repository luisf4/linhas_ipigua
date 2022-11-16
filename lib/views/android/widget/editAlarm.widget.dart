// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditAlarm extends StatefulWidget {
  final int idDocumento;
  EditAlarm({super.key, required this.idDocumento});

  @override
  State<EditAlarm> createState() => _EditAlarmState();
}

class _EditAlarmState extends State<EditAlarm> {
  // Controllers
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  // Firebase
  final firebase = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('alarms');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Alarm'),
      ),

      //ADICIONAR UM TEXTFILD PRE PRENCHIDO PARA CADA UM DOS ITEMS NO FIREBASE, SEMPRE QUANDO CLICADO NO BOTÃO RE ESCREVER OS DADOS NO FIREBASE E RE FAZER A NOTIFICAÇÃO, AO EXLUIR EXCLUIR TODOS OS
      // DADOS DO FIREBASE JUNTAMENTE COM O ALARME E JOGAR PARA OUTRA TELA
      body: Column(
        children: [
          Text('aaaaaaa'),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: firebase
                  .where('id', isEqualTo: widget.idDocumento)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox(
                      child: Center(child: CircularProgressIndicator()));
                }

                if (snapshot.hasError) return Text(snapshot.error.toString());

                var documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (_, index) {
                    var document = documents[index];
                    return Column(
                      children: [
                        Text(document['body']),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _titleController,
                            obscureText: true,
                            // initialValue: document['title'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Title',
                              hintText: 'Title',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _bodyController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Body',
                              hintText: 'Body',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
