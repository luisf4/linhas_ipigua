// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/home.app.dart';
import 'package:linhas_ipigua/views/android/login.app.dart';
import 'package:linhas_ipigua/views/android/models/utils.model.dart';


final navigatorKey = GlobalKey<NavigatorState>();

class AndroidApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      // debugShowCheckedModeBanner: false,
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
