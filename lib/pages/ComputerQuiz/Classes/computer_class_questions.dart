import 'package:flutter_quiz_2/pages/ComputerQuiz/Classes/computer_class.dart';

class ComputerQBank {
  int computerQuestionNumber = 0;

  //list of questions,options ande correct answer index

  List<ComputerClass> cQuestions = [
    ComputerClass(
      computerQuestions: " Who is the father of Computers ?",
      computerCorrectAnswerIndex: 1,
      cOptions: [
        "a.  James Gosling",
        "b. Charles Babbage",
        "c. Dennis Ritchie",
        "d. Dennis Ritchie",
      ],
    ),
    ComputerClass(
      computerQuestions:
          "Which of the following language does the computer understand?",
      computerCorrectAnswerIndex: 2,
      cOptions: [
        "a.Computer understands only C Language ",
        "b. Computer understands only Assembly Language",
        "c. Computer understands only Binary Language",
        "d. Computer understands only BASIC",
      ],
    ),
    ComputerClass(
      computerQuestions: "Which of the following is the brain of the computer?",
      computerCorrectAnswerIndex: 0,
      cOptions: [
        "a. Central Processing Uni",
        "b. Memory",
        "c. Arithmetic and Logic unit",
        "d. Control unit",
      ],
    ),
    ComputerClass(
      computerQuestions:
          "Which of the following computer language is written in binary codes only?",
      computerCorrectAnswerIndex: 1,
      cOptions: [
        "a. pascal",
        "b. machine language",
        "c. C",
        "d. C#",
      ],
    ),
    ComputerClass(
      computerQuestions:
          "Which of the following is the smallest unit of data in a computer?",
      computerCorrectAnswerIndex: 0,
      cOptions: [
        "a. Bit",
        "b. KB",
        "c. Nibble",
        "d. Byte",
      ],
    ),
    ComputerClass(
      computerQuestions:
          "Which of the following unit is responsible for converting the data received from the user into a computer understandable format?",
      computerCorrectAnswerIndex: 1,
      cOptions: [
        "a. Output Unit",
        "b. Input Unit",
        "c.  Memory Unit",
        "d. Arithmetic & Logic Unit",
      ],
    ),
    ComputerClass(
      computerQuestions:
          "Which of the following monitor looks like a television and are normally used with non-portable computer systems?",
      computerCorrectAnswerIndex: 2,
      cOptions: [
        "a. LED",
        "b. LCD",
        "c. CRT",
        "d. Flat Panel Monitors",
      ],
    ),
    ComputerClass(
      computerQuestions:
          " Which of the following is not a type of computer code?",
      computerCorrectAnswerIndex: 2,
      cOptions: [
        "a. EDIC",
        "b. ASCII",
        "c. BCD",
        "d. EBCDIC",
      ],
    ),
    ComputerClass(
      computerQuestions:
          "Which of the following part of a processor contains the hardware necessary to perform all the operations required by a computer?",
      computerCorrectAnswerIndex: 3,
      cOptions: [
        "a. Controller",
        "b. Registers",
        "c. Cache",
        "d. Data path",
      ],
    ),
    ComputerClass(
      computerQuestions:
          "Which of the following is designed to control the operations of a computer?",
      computerCorrectAnswerIndex: 2,
      cOptions: [
        "a. User",
        "b. Application Software",
        "c. System Software",
        "d. Utility Software",
      ],
    ),
  ];

// method for previous button
  void previousComputerQuestions() {
    if (computerQuestionNumber > 0) {
      computerQuestionNumber--;
    }
  }

//method to check whether the question is last or not
  bool isLastCompuetrQuestion() {
    if (computerQuestionNumber == cQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

// goto next question

  void goToNextQuestion() {
    if (computerQuestionNumber < cQuestions.length - 1) {
      computerQuestionNumber++;
    }
  }

  //to access the correct answer index

  int correctComputerAnswer() {
    return cQuestions[computerQuestionNumber].computerCorrectAnswerIndex;
  }

  //to reset quiz

  void resetComputerQuiz() {
    computerQuestionNumber = 0;
  }

// to access the option from the list
  List getOptions() {
    return cQuestions[computerQuestionNumber].cOptions;
  }

//to access the question from the list to computer.dart page
  String getQuestion() {
    return cQuestions[computerQuestionNumber].computerQuestions;
  }
}
