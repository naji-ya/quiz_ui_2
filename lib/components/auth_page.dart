import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/pages/quiz_home.dart';
import 'package:flutter_quiz_2/screens/log_in_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //  user is  logged in

          if (snapshot.hasData) {
            return const QuizHome();
          }

          // user is not logged in
          else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
