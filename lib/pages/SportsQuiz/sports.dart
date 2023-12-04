import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/pages/SportsQuiz/classes/sports_class_questions.dart';
import 'package:flutter_quiz_2/components/previous_button.dart';
import 'package:flutter_quiz_2/components/sports_score.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/next_button.dart';

// crate object sportsqbank for the class SportsQbank
SportsQbank sportsqbank = SportsQbank();

class SportsPage extends StatefulWidget {
  const SportsPage({
    super.key,
  });

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  //at the begining the selectedOptionIndex must be initialised with a value that not exist
  int selectedOptionIndex = -1;
  int score = 0;

// method to get the score while the correct option is selected

  void setAnswer() {
    if (selectedOptionIndex == sportsqbank.correctAnswer()) {
      setState(() {
        score++;
      });
    }
  }

/*to adjust the appearence of the previous button ,for the first question there
will not be a previous button ,
so that at the begining the showPreviousButton has to be set false
*/

  bool showPreviousButton = false;

// method to check whether the question number is greater than 0 , if yes then the previous button appear

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
                    // inside a sizedbox and padding ,used to show the questions from the class list

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

          // listview.builder is used to show the options
          ListView.builder(
              shrinkWrap: true,
              // number of options is the item count

              itemCount: sportsqbank.getOption().length,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = selectedOptionIndex == index;
                bool isCorrect = sportsqbank.correctAnswer() == index;

                /* if the option selected is the correct answer then the option color is changed to green ,
                 if the option selected is wrong then the  option color is changed to red,and 
                 if no option is selected then its color remain as black
                */
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
                          // to display the options
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
              // to show the previous button if the question number is greater than 0
              if (showPreviousButton = sportsqbank.questionNumber > 0)
                PreviousButton(
                  onTap: onPreviousButtonPressed,
                ),
              NextButton(onTap: () {
                setState(() {
                  // if the user is in last question then it should navigate to the score page,other wise go to next question
                  if (sportsqbank.isLastQuestion() == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SportsScore(score: score)),
                      ),
                    );
// to reset the quiz from the begining
                    sportsqbank.resetQuiz();
                  } else {
                    //go to next question
                    sportsqbank.getNextQuestion();
                  }
                });
                /* if we select an answer from option of a question ,then the same answer is  still selected 
                in the next question's option,to overcome that or to avoid that selection set 
                the selected index as non index value  */
                selectedOptionIndex = -1;
              }),
            ],
          ),
        ],
      ),
    );
  }
}
