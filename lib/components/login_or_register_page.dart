import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/screens/log_in_screen.dart';
import 'package:flutter_quiz_2/screens/register_screen.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // initially show login page

  bool showLoginPage = true;

  //toogle between login and register
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(onTap: togglePage);
    } else {
      return RegisterScreen(
        onTap: togglePage,
      );
    }
  }
}
