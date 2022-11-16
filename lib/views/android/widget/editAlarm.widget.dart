import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditAlarm extends StatefulWidget {
  const EditAlarm({super.key});

  @override
  State<EditAlarm> createState() => _EditAlarmState();
}

class _EditAlarmState extends State<EditAlarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Alarm'),
      ),

      //ADICIONAR UM TEXTFILD PRE PRENCHIDO PARA CADA UM DOS ITEMS NO FIREBASE, SEMPRE QUANDO CLICADO NO BOTÃO RE ESCREVER OS DADOS NO FIREBASE E RE FAZER A NOTIFICAÇÃO, AO EXLUIR EXCLUIR TODOS OS
      // DADOS DO FIREBASE JUNTAMENTE COM O ALARME E JOGAR PARA OUTRA TELA
      body: Column(
        children: [],
      ),
    );
  }
}
