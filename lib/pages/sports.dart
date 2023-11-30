import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/classes/sports_class_questions.dart';
import 'package:flutter_quiz_2/components/previous_button.dart';
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

  bool showPreviousButton = false;

  void onPreviousButtonPressed() {
    sportsqbank.getPreviousQuestion();
    setState(() {
      showPreviousButton = sportsqbank.questionNumber > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Quiz On Sports",
            style: GoogleFonts.akshar(
              color: Colors.amber,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
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
              height: 170,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 15),
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
          ),
          const SizedBox(
            height: 15,
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3, right: 25, left: 25, bottom: 3),
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
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          sportsqbank.getOption()[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (showPreviousButton = sportsqbank.questionNumber > 0)
                PreviousButton(
                  onTap: onPreviousButtonPressed,
                ),
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
                      sportsqbank.resetQuiz();
                    } else {
                      sportsqbank.getNextQuestion();
                    }
                  });
                  selectedOptionIndex = -1;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
