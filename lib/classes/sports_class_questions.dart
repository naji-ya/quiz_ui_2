import 'package:flutter_quiz_2/classes/sports_class.dart';

class SportsQbank {
  int questionNumber = 0;

  List<SportsClass> questions = [
    SportsClass(
      sportsQuestion: " After how many Years FIFA World Cup held?",
      sportsCorrectAnswerIndex: 2,
      options: ["a. Two years", "b. Three years", "c. Four years", "d. Every "],
    ),
    SportsClass(
      sportsQuestion: " Which Countrys won the first FIFA World Cup?",
      sportsCorrectAnswerIndex: 1,
      options: ["a. Argentina", "b. Uruguay", "c. Italy", "d. Brazil "],
    ),
    SportsClass(
      sportsQuestion: " Who won the first ICC World Cup?",
      sportsCorrectAnswerIndex: 1,
      options: ["a. India", "b. West Indies", "c. England", "d. Australia "],
    ),
    SportsClass(
      sportsQuestion: " Who won the first T20 World Cup?",
      sportsCorrectAnswerIndex: 1,
      options: ["a. Pakistan", "b. India", "c. Sri Lanka", "d. West Indies"],
    ),
    SportsClass(
      sportsQuestion: " Who is known as the Flying Sikh?",
      sportsCorrectAnswerIndex: 2,
      options: [
        "a. Michael Johnson",
        "b. Usain Bolt",
        "c. Milkha Sing",
        "d. Carl Lewis"
      ],
    ),
    SportsClass(
      sportsQuestion:
          " Who has the Highest Number of Gold Medals in Olympic History?",
      sportsCorrectAnswerIndex: 2,
      options: [
        "a. Larisa Latynina",
        "b. Mark Spitz",
        "c. Michael Phelps",
        "d. Saina Nehwal "
      ],
    ),
    SportsClass(
      sportsQuestion: " What is the 100m World Record of Usain Bolt?",
      sportsCorrectAnswerIndex: 1,
      options: ["a. 14.35 Sec", "b. 9.58 Sec", "c. 9.05 Sec", "d. 10.12 Sec "],
    ),
    SportsClass(
      sportsQuestion:
          " What is the Women/’s World Record for the 100-Meter Dash?",
      sportsCorrectAnswerIndex: 3,
      options: ["a. 12.35 Sec", "b. 10.45 Sec", "c. 9.55 Sec", "d. 10.49 Sec "],
    ),
    SportsClass(
      sportsQuestion: " Where is the Famous Boxer Mary Kom from?",
      sportsCorrectAnswerIndex: 0,
      options: [
        "a. Manipur",
        "b. Mizoram",
        "c. Nagaland",
        "d. Tripura",
      ],
    ),
    SportsClass(
      sportsQuestion: " How many FIFA World Cup has been played till 2022?",
      sportsCorrectAnswerIndex: 1,
      options: ["a. 29", "b. 52", "c. 22", "d. 14 "],
    ),
  ];

  String getQuestion() {
    return questions[questionNumber].sportsQuestion;
  }

  List getOption() {
    return questions[questionNumber].options;
  }

  bool isLastQuestion() {
    if (questionNumber == questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int correctAnswer() {
    return questions[questionNumber].sportsCorrectAnswerIndex;
  }

  void getNextQuestion() {
    if (questionNumber < questions.length - 1) {
      questionNumber++;
    }
  }
}
