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
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(
          onClickedSignUp: toggle,
        )
      : SignUpWidget(onClikedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
