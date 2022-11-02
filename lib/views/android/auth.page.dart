// ignore_for_file: implementation_imports

import 'package:flutter/src/widgets/framework.dart';
import 'package:linhas_ipigua/views/android/widget/login.widget.dart';
import 'package:linhas_ipigua/views/android/widget/signup.widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  //verifica se esta logado
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(
          onClickedSignUp: toggle,
        )
      : SignUpWidget(onClikedSignIn: toggle);

  // muda a pagina quando for clocado em uma das 2 opções
  void toggle() => setState(() => isLogin = !isLogin);
}
