// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(user.email!), // mostra o email do usuario logado
          ),
          ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(), // desloga
              child: Text("Deslogar"))
        ],
      ),
    );
  }
}
