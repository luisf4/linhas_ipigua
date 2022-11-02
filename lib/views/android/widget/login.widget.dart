// ignore_for_file: prefer_const_constructors, annotate_overrides, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:linhas_ipigua/views/android/models/utils.model.dart';
import 'package:linhas_ipigua/views/android/widget/forgot.widget.dart';

class LoginWidget extends StatefulWidget {
  //
  final VoidCallback onClickedSignUp;
  //
  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  //
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // limpa as variaveis
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            // transforma tudo wraped em rolaver
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Login",
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
                      // verifica se o email é valido
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
                      // verifica se a senha podera ser usada
                      validator: (value) => value != null && value.length < 6
                          ? "Min 6 characters"
                          : null),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: signIn,
                    child: Text("Login"),
                  ),
                ),
                // basicamente um botão com outro nome
                GestureDetector(
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordWidget(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // outro botão com frescuras
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.amber, fontSize: 15),
                    text: "Don't have a accont ? ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: "Register",
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
      ),
    );
  }

  Future signIn() async {
    // 'verifica' se os forms estão prenchidos corretamente
    final isValid = formKey.currentState!.validate();
    if (!isValid) return; // retorna nada se não for valido

    // mostra bolinha de carregamento
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // connecta com firebase e valida o login
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // se não conseguir validar retorna o erro na tela
      Utils.showSnackBar(e.message);
    }
    // fecha a bolinha de carregamento
    Navigator.of(context).pop();
  }
}
