// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linhas_ipigua/views/android/models/notificationn.moldel.dart';
import 'package:flutter/material.dart';
import '../models/utils.model.dart';

class EditAlarm extends StatefulWidget {
  final int idDocumento;
  const EditAlarm({super.key, required this.idDocumento});

  @override
  State<EditAlarm> createState() => _EditAlarmState();
}

class _EditAlarmState extends State<EditAlarm> {
  // Controllers
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  // Firebase

  bool fildConfirm() {
    if (_bodyController.text == '') {
      return false;
    } else if (_titleController.text == '') {
      return false;
    } else {
      return true;
    }
  }

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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Aqui você poderá adicionar descrição no alarme',
              style: TextStyle(fontSize: 20),
            ),
          ),
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
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Título',
                              hintText: 'Título',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: _bodyController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Descrição',
                              hintText: 'Descrição',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              // EDIT BUTTON
                              Expanded(
                                child: InkWell(
                                  child: Icon(
                                    Icons.done,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    remakeAlarm(document);
                                  },
                                ),
                              ),

                              // DELETE BUTTOn
                              Expanded(
                                child: InkWell(
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    NotificationService()
                                        .cancelAllNotifications(document['id']);
                                    deleteData(document.id.toString());
                                    Navigator.of(context).pop();
                                  },
                                ),
                              )
                            ],
                          ),
                        )
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

  void remakeAlarm(document) {
    if (fildConfirm()) {
      var uuid = DateTime.now()
          .difference(DateTime.fromMillisecondsSinceEpoch(1640979000000))
          .inSeconds;

      NotificationService().cancelAllNotifications(document['id']);
      final int differenceNew;
      final difference =
          DateTime.parse(document['date']).difference(DateTime.now()).inSeconds;
      if (difference < 0) {
        differenceNew = DateTime.parse(document['date'])
            .add(Duration(days: 1))
            .difference(DateTime.now())
            .inSeconds;
      } else {
        differenceNew = difference;
      }

      NotificationService().showNotification(
        uuid,
        _titleController.text.trim(),
        _bodyController.text.trim(),
        differenceNew,
      );

      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('alarms')
          .doc(document.id)
          .set({
        'id': uuid,
        'title': _titleController.text.trim(),
        'body': _bodyController.text.trim() + '   ' + document['horario'],
        'horario': document['horario'],
        'date':
            DateTime.now().add(Duration(milliseconds: differenceNew)).toString()
      });
      Navigator.of(context).pop();
    } else {
      Utils.showSnackBar('Prencha todos os campos');
    }
  }

  Future deleteData(String id) async {
    try {
      await firebase.doc(id).delete();
    } catch (e) {
      return false;
    }
  }
}


