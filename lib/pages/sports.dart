import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/classes/sports_class_questions.dart';
import 'package:flutter_quiz_2/components/sports_score.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/next_button.dart';

SportsQbank sportsqbank = SportsQbank();

class SportsPage extends StatefulWidget {
  const SportsPage({
    super.key,
  });

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  int selectedOptionIndex = -1;
  int score = 0;

  void setAnswer() {
    if (selectedOptionIndex == sportsqbank.correctAnswer()) {
      setState(() {
        score++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Quiz On Sports",
          style: GoogleFonts.akshar(
            color: Colors.amber,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: Center(
                child: Text(
                  sportsqbank.getQuestion(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: sportsqbank.getOption().length,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = selectedOptionIndex == index;
                bool isCorrect = sportsqbank.correctAnswer() == index;
                Color getColor() {
                  if (isSelected) {
                    return isCorrect ? Colors.green : Colors.red;
                  }
                  return Colors.black;
                }

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptionIndex = index;

                      setAnswer();
                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: getColor(),
                        border: Border.all(
                          color: const Color.fromARGB(255, 241, 213, 130),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(3.0),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        sportsqbank.getOption()[index],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                );
              }),
          NextButton(
            onTap: () {
              setState(() {
                if (sportsqbank.isLastQuestion() == true) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => SportsScore(score: score)),
                    ),
                  );
                } else {
                  sportsqbank.getNextQuestion();
                }
              });
              selectedOptionIndex = -1;
            },
          ),
        ],
      ),
    );
  }
}
