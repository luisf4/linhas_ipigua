import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Perfil de usuario "),
            Icon(
              Icons.person,
              size: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                    'Email: ${user.email!}'), // mostra o email do usuario logado
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                FirebaseAuth.instance.signOut(),
                Navigator.of(context).pop()
              }, // desloga
              child: Text("Deslogar"),
            ),
          ],
        ),
      ),
    );
  }
}
