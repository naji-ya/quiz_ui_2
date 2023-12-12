import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/previous_button.dart';
import 'package:flutter_quiz_2/pages/ComputerQuiz/Classes/computer_class_questions.dart';
import 'package:flutter_quiz_2/pages/ComputerQuiz/computer_score.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../components/next_button.dart';

// object creation

ComputerQBank computerqbank = ComputerQBank();

class ComputerPage extends StatefulWidget {
  const ComputerPage({super.key});

  @override
  State<ComputerPage> createState() => _ComputerPageState();
}

class _ComputerPageState extends State<ComputerPage> {
  int selectedComputerOptionIndex = -1;
  int score = 0;

  setComputerAnswer() {
    if (selectedComputerOptionIndex == computerqbank.correctComputerAnswer()) {
      setState(() {
        score++;
      });
    }
  }

  bool showPreviousButton = false;

  void onPreviousButtonPressed() {
    computerqbank.previousComputerQuestions();
    setState(() {
      showPreviousButton = computerqbank.computerQuestionNumber > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Computer",
            style: GoogleFonts.akshar(
              color: Colors.amber,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: IconButton(
                onPressed: () {
                  Alert(
                      context: context,
                      title: "Do you want to exit ?",
                      style: AlertStyle(
                        alertBorder: Border.all(
                          color: Colors.amber,
                        ),
                        backgroundColor: Colors.black,
                        titleStyle:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'homepage');
                          },
                          color: Colors.amber,
                          height: 45,
                          margin: const EdgeInsets.all(2),
                          child: const Text(
                            "OK",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DialogButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.amber,
                          height: 45,
                          child: const Text(
                            "NO",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]).show();
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                )),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              height: 170,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 15),
                child: Center(
                  child: Text(
                    computerqbank.getQuestion(),
                    style: const TextStyle(color: Colors.white, fontSize: 23),
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
            itemCount: computerqbank.getOptions().length,
            itemBuilder: (BuildContext context, int index) {
              bool isSelected = selectedComputerOptionIndex == index;
              bool isCorrect = computerqbank.correctComputerAnswer() == index;

// to set color for wrong and correct  answer

              Color getColor() {
                if (isSelected) {
                  return isCorrect ? Colors.green : Colors.red;
                }
                return Colors.black;
              }

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedComputerOptionIndex = index;

                    setComputerAnswer();
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
                        // to display the options
                        computerqbank.getOptions()[index],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // to show the previous button if the question number is greater than 0
              if (showPreviousButton = computerqbank.computerQuestionNumber > 0)
                PreviousButton(
                  onTap: onPreviousButtonPressed,
                ),
              NextButton(onTap: () {
                // if the user is in last question then it should navigate to the score page,other wise go to next question
                if (computerqbank.isLastCompuetrQuestion() == true) {
                  // to reset the quiz from the begining
                  computerqbank.resetComputerQuiz();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ComputerScore(score: score)),
                    ),
                  );
                } else {
                  setState(() {
                    computerqbank.goToNextQuestion();
                  });
                  //go to next question

                }

                /* if we select an answer from option of a question ,then the same answer is  still selected 
                in the next question's option,to overcome that or to avoid that selection set 
                the selected index as non index value  */
                selectedComputerOptionIndex = -1;
              }),
            ],
          ),
        ],
      ),
    );
  }
}
