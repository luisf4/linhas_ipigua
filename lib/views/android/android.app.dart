// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/alarmeonibus.page.dart';
import 'package:linhas_ipigua/views/android/listaonibus.page.dart';



class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaOnibus(),
      routes: {
        '/lista':(context) => ListaOnibus(),
        '/create':(context) => AlarmeOnibus(),
      },
    );
  }
}