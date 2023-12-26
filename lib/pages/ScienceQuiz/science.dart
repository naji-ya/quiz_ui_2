import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/pages/ScienceQuiz/classes/science_question_class.dart';
import 'package:flutter_quiz_2/pages/ScienceQuiz/science_score.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../components/next_button.dart';
import '../../components/previous_button.dart';

// object creation of the ScienceQBank class

ScienceQBank scienceqbank = ScienceQBank();

class SciencePage extends StatefulWidget {
  const SciencePage({super.key});

  @override
  State<SciencePage> createState() => _SciencePageState();
}

class _SciencePageState extends State<SciencePage> {
  //at the begining the selectedOptionIndex must be initialised with a value that not exist

  int selectedScienceAnswerIndex = -1;
  int score = 0;

// method to get the score while the correct option is selected

  void setScienceAnswer() {
    if (selectedScienceAnswerIndex ==
        scienceqbank.getCorrectScienceAnswerIndex()) {
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

  void onPreviousButtonClicked() {
    scienceqbank.goToPreviousScienceQuestion();
    setState(() {
      showPreviousButton = scienceqbank.scienceQuestionNumber > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            " Science",
            style: GoogleFonts.akshar(
              color: Colors.white,
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

                    scienceqbank.getScienceQuestion(),
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

              itemCount: scienceqbank.getScienceOptions().length,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = selectedScienceAnswerIndex == index;
                bool isCorrect =
                    scienceqbank.getCorrectScienceAnswerIndex() == index;

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
                      selectedScienceAnswerIndex = index;

                      setScienceAnswer();
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
                          scienceqbank.getScienceOptions()[index],
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
              if (showPreviousButton = scienceqbank.scienceQuestionNumber > 0)
                PreviousButton(
                  onTap: onPreviousButtonClicked,
                ),
              NextButton(onTap: () {
                // if the user is in last question then it should navigate to the score page,other wise go to next question
                if (scienceqbank.isLastScienceQuestion() == true) {
                  // to reset the quiz from the begining

                  scienceqbank.resetScienceQuiz();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ScienceScore(score: score)),
                    ),
                  );
                } else {
                  //go to next question
                  setState(() {
                    scienceqbank.goToNextScienceQuestion();
                  });
                }

                /* if we select an answer from option of a question ,then the same answer is  still selected 
                in the next question's option,to overcome that or to avoid that selection set 
                the selected index as non index value  */
                selectedScienceAnswerIndex = -1;
              }),
            ],
          ),
        ],
      ),
    );
  }
}
