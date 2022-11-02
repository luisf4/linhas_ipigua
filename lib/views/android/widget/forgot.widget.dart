// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/models/utils.model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  //
  final formKey = GlobalKey<FormState>();
  final _emailResetController = TextEditingController();

  // limpa as informações dentro da variavel
  @override
  void dispose() {
    _emailResetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // não deixa os widgets se redimencionarem ??? i think so
      resizeToAvoidBottomInset: false,
      // appbar :7
      appBar: AppBar(
        title: Text("Reset password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child:
              // faz tudo que esteja dentro do widget SingleChildScrollView seja rolavel
              SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Reset password",
                    style: TextStyle(fontSize: 40, color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      controller: _emailResetController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                          hintText: "Enter your account email"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => // valida se o email é valido
                          email != null && !EmailValidator.validate(email)
                              ? "Use a valid email !" // se não for mostra uma menssagem em baixo do textFild
                              : null),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.email),
                    label: Text("Send me a reset link"),
                    onPressed: () => resetPassword(), // email reset
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
      // mostra bolinha de carregamento
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    // Resetar senha (envia um email com link para o email do usuario)
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        // manda o email
        email: _emailResetController.text.trim(),
      );
      // notifica se foi enviado
      Utils.showSnackBar("Password reset link sent");
    } on FirebaseAuthException catch (e) {
      // mostra a mensagem de erro caso algo ocorra errado
      Utils.showSnackBar(e.message);
    }
    // fecha o teclado
    FocusManager.instance.primaryFocus?.unfocus();
    // fecha bolinha de carregamento
    Navigator.of(context).pop();
  }
}
