// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/home.app.dart';
import 'package:linhas_ipigua/views/android/login.app.dart';
import 'package:linhas_ipigua/views/android/models/utils.model.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey, // key para menssagens de erro
      home: LoginPage(), // pagina inicial

      // rotas
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
