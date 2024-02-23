import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/start_button.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  // signout the user
  void userLogOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: userLogOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "WELCOME",
                      style: TextStyle(
                        color: buttonColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Quiz! ",
                      style: GoogleFonts.akshar(
                        color: buttonColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/stackofbooks.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            const StartButton(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
