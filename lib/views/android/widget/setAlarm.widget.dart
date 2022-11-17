// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:linhas_ipigua/views/android/models/notificationn.moldel.dart';
import 'package:uuid/uuid.dart';

class SetAlarm extends StatelessWidget {
  final String horario;
  const SetAlarm({super.key, required this.horario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set alarm"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(horario),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                var uuid = DateTime.now()
                    .difference(
                        DateTime.fromMillisecondsSinceEpoch(1640979000000))
                    .inSeconds;

                // Converte e trata os dados do banco
                final String horarioTratado = horario.replaceAll(' ', '');
                final int differenceNew;
                final String date = DateTime.now().toString();
                final String old =
                    date[11] + date[12] + date[13] + date[14] + date[15];
                final String novo = date.replaceAll(old, horarioTratado.trim());

                // calcula a diferença entre horario de agora para o horario que o alarme irá tocar
                final difference =
                    DateTime.parse(novo).difference(DateTime.now()).inSeconds;
                if (difference < 0) {
                  differenceNew = DateTime.parse(novo)
                      .add(Duration(days: 1))
                      .difference(DateTime.now())
                      .inSeconds;
                } else {
                  differenceNew = difference;
                }

                // random id para usar no .doc()
                var uid = Uuid().v1();

                // pegar a diferença e adicionar a firebase
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('alarms')
                    .doc(uid.toString())
                    .set({
                  'horario': horario,
                  'id': uuid,
                  'title': 'Ônibus',
                  'body': 'O ônibus sairá as $horario',
                  'date': DateTime.now()
                      .add(Duration(milliseconds: differenceNew))
                      .toString()
                });

                NotificationService().showNotification(
                  uuid,
                  "Ônibus",
                  "O ônibus sairá as $horario",
                  differenceNew,
                );
              },
              child: Text("Set a Alarm to $horario"),
            )
          ],
        ),
      ),
    );
  }
}
