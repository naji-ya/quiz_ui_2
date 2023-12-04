import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/pages/BookQuiz/book_score.dart';
import 'package:flutter_quiz_2/pages/BookQuiz/classes/books_class_questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../components/next_button.dart';
import '../../components/previous_button.dart';

//create an object for BookQBank
BooksQBank booksqbank = BooksQBank();

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  int? selectedBookOptionIndex;
  int score = 0;

  // method to get the score while the correct option is selected

  void setBookAnswer() {
    if (selectedBookOptionIndex == booksqbank.correctBookAnswer()) {
      setState(() {
        score++;
      });
    }
  }

  bool showPreviousButton = false;
  void onPreviousButtonPressed() {
    booksqbank.getPreviousBookQuestion();
    setState(() {
      showPreviousButton = booksqbank.booksQuestionNumber > 0;
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
                      title: "Alert!",
                      style: AlertStyle(
                        alertBorder: Border.all(
                          color: Colors.amber,
                        ),
                        backgroundColor: Colors.black,
                        titleStyle:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      content: Column(
                        children: const [
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Do you  want to exit ?              ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Your current score will loose if you exit now",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Quiz On Books",
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

                    booksqbank.getBookQuestions(),
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

              itemCount: booksqbank.getBooksOptions().length,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = selectedBookOptionIndex == index;
                bool isCorrect = booksqbank.correctBookAnswer() == index;

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
                      selectedBookOptionIndex = index;

                      setBookAnswer();
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
                          booksqbank.getBooksOptions()[index],
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
              if (showPreviousButton = booksqbank.booksQuestionNumber > 0)
                PreviousButton(
                  onTap: onPreviousButtonPressed,
                ),
              NextButton(onTap: () {
                setState(() {
                  // if the user is in last question then it should navigate to the score page,other wise go to next question
                  if (booksqbank.isLastBookQuestion() == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => BooksScore(score: score)),
                      ),
                    );
// to reset the quiz from the begining
                    booksqbank.resetQuiz();
                  } else {
                    //go to next question
                    booksqbank.getNextQuestion();
                  }
                });
                /* if we select an answer from option of a question ,then the same answer is  still selected 
                in the next question's option,to overcome that or to avoid that selection set 
                the selected index as non index value  */
                selectedBookOptionIndex = -1;
              }),
            ],
          ),
        ],
      ),
    );
  }
}
