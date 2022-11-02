// ignore_for_file: prefer_const_constructors, annotate_overrides, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:linhas_ipigua/views/android/models/utils.model.dart';

class SignUpWidget extends StatefulWidget {
  //
  final Function() onClikedSignIn;
  //
  const SignUpWidget({
    Key? key,
    required this.onClikedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  //
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // limpa as informações dentro da variavel
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // não deixa os widgets se redimencionarem
      resizeToAvoidBottomInset: false,
      // appbar :7
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child:
            // faz tudo que esteja dentro do widget SingleChildScrollView seja rolavel
            SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 40, color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    controller: _emailController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                        hintText: "Enter a e-mail"),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // verifica se o e-mail é valido
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? "Use a valid email!"
                            : null),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // verifica se a senha pode ser ultilizado
                    validator: (value) => value != null && value.length < 6
                        ? "Min 6 characters"
                        : null),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: signUp, // registra
                  child: Text("Register"),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.amber, fontSize: 15),
                  text: "Already have a accont ? ",
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            widget.onClikedSignIn, //muda para widget signin
                      text: "Login",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    // mostra bolinha de carregamento
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    // cria usuario no firebase
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // mostra na tela o erro caso ocorra um
      Utils.showSnackBar(e.message);
    }
    // fecha bolinha de carregamento
    Navigator.of(context).pop();
  }
}
