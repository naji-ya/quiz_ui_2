import 'package:flutter_quiz_2/pages/HistoryQuiz/classes/history_class.dart';

class HistoryQBank {
  int historyQuestionNumber = 0;
//create list for question ,options and correct answer index

  List<HistoryClass> hQuestions = [
//constructor of gameclass

    HistoryClass(
      historyQuestions:
          "During the First World War,which country signed the Peace threaty (1917) with Germany ?",
      historyCorrectAnswerIndex: 2,
      hOptions: [
        "a. England",
        "b. USA",
        "c. Russia",
        "d. Austria",
      ],
    ),

    HistoryClass(
      historyQuestions:
          "Mahatma Gandhi launched Kedha Sathyagrah on Gujarat in 1918 to support the cause of : ?",
      historyCorrectAnswerIndex: 2,
      hOptions: [
        "a. Mill Owners",
        "b. Land Lords",
        "c. The Peasants",
        "d. Kol Rebellion",
      ],
    ),

    HistoryClass(
      historyQuestions:
          "What was the name of the atom bomb dropped in Nagasaki city ?",
      historyCorrectAnswerIndex: 1,
      hOptions: [
        "a. Fat Boy",
        "b. Fat Man",
        "c. Scorpion",
        "d. Death Kiss",
      ],
    ),

    HistoryClass(
      historyQuestions: "Quit India movement  began on ?",
      historyCorrectAnswerIndex: 2,
      hOptions: [
        "a. August 9,1940",
        "b. August 9,1941",
        "c. August 8,1942",
        "d. August 9,1944",
      ],
    ),

    HistoryClass(
      historyQuestions:
          "The Law of Twelve Tables was concerned with which civilization ? ",
      historyCorrectAnswerIndex: 2,
      hOptions: [
        "a. Egypt",
        "b. Greece",
        "c. Rome",
        "d. China",
      ],
    ),

    HistoryClass(
      historyQuestions: "Tipu Sulthan was the roler of :",
      historyCorrectAnswerIndex: 2,
      hOptions: [
        "a. Hyderabad",
        "b. Madurai",
        "c. Mysore",
        "d. Vijaynagar",
      ],
    ),

    HistoryClass(
      historyQuestions: "The first atomic bomb was thrown over :?",
      historyCorrectAnswerIndex: 1,
      hOptions: [
        "a. Nagasaki",
        "b. Hiroshima",
        "c. Tokyo",
        "d. Hong Kong",
      ],
    ),

    HistoryClass(
      historyQuestions: "Alexander the great,was obliged to go back because:",
      historyCorrectAnswerIndex: 2,
      hOptions: [
        "a. he fell ill",
        "b. he suffered defeat in India",
        "c. his force refused to go further",
        "d. he did not like India",
      ],
    ),

    HistoryClass(
      historyQuestions:
          "In which year,the RMS Titanic sank in the North Atlantic Ocean after colliding with an iceberg ? ",
      historyCorrectAnswerIndex: 3,
      hOptions: [
        "a. 1905",
        "b. 1910",
        "c. 1911",
        "d. 1912",
      ],
    ),
  ];

  //method  to access question

  String getQuestion() {
    return hQuestions[historyQuestionNumber].historyQuestions;
  }

//method to access the options
  List getOptions() {
    return hQuestions[historyQuestionNumber].hOptions;
  }

  // to go to next question

  void goToNextQuestion() {
    if (historyQuestionNumber < hQuestions.length - 1) {
      historyQuestionNumber++;
    }
  }

  // to check is it last question

  bool isLastQuestion() {
    if (historyQuestionNumber == hQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  // get correct answer index

  int historyCorrectAnswer() {
    return hQuestions[historyQuestionNumber].historyCorrectAnswerIndex;
  }

  // reset quiz

  void resetHistoryQuiz() {
    historyQuestionNumber = 0;
  }

  //goto previous question

  void getPreviousHQuestion() {
    if (historyQuestionNumber > 0) {
      historyQuestionNumber--;
    }
  }
}
