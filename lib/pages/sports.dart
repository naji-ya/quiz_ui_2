import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/classes/sports_class_questions.dart';
import 'package:google_fonts/google_fonts.dart';

SportsQbank sportsqbank = SportsQbank();

class SportsPage extends StatefulWidget {
  const SportsPage({super.key});

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Quiz On Sports",
          style: GoogleFonts.akshar(
            color: const Color.fromARGB(255, 247, 198, 3),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              width: double.infinity,
              height: 180,
              child: Center(
                child: Text(
                  sportsqbank.getQuestion(),
                  style: GoogleFonts.aleo(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: sportsqbank.getOption().length,
            itemBuilder: (context, index) {
              return GestureDetector();
            },
          ),
        ],
      ),
    );
  }
}
