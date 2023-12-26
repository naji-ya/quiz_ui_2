import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../components/start_button.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
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
                    height: 50,
                  ),
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      "assets/quizBook.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            const StartButton(),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Alert(
                    context: context,
                    title: " Your account will not be eraised !",
                    style: AlertStyle(
                      alertBorder: Border.all(
                        color: Colors.amber,
                      ),
                      backgroundColor: Colors.black,
                      titleStyle:
                          const TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                    buttons: [
                      DialogButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'log_in_screen');
                        },
                        color: Colors.amber,
                        child: const Text(
                          "Log out",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DialogButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.amber,
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]).show();
              },
              child: Text(
                "Log out",
                style: TextStyle(
                  color: textOneColor,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
