// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic listaCidade(cidade) {
    return InkWell(
      onTap: () {},
      child: Center(
        child: Container(
          width: 99999,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 69, 69, 69)),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(
            child: Text(
              cidade,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Linhas Ipiguá"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: [
              listaCidade('Ipiguá -> Rio Preto'),
              listaCidade("Rio Preto -> Ipiguá"),
              listaCidade("S.J.R PRETO -> BADY BASSITT "),
              listaCidade("BADY BASSITT -> SJRIO PRETO"),
              listaCidade("SJRIO PRETO -> NOVA ALIANÇA "),
              listaCidade("NOVA ALIANÇA -> SJ RIO PRETO"),
            ],
          ),
        ),
      ),
    );
  }
}
