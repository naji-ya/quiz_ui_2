import 'package:flutter_quiz_2/pages/MusicQuiz/classes/music_class.dart';

class MusicQBank {
  int musicQuestionNumber = 0;
  // list of questions,options and correct answer index

  List<MusicClass> mQuestions = [
    // constructor of music class

    MusicClass(
      musicQuestions:
          "To consider a band as a Big Band what is the minimum number of musicians to be needed?",
      musicCorrectAnswerIndex: 3,
      mOptions: [
        "a. 11",
        "b. 21",
        "c. 12",
        "d. 10",
      ],
    ),

    MusicClass(
      musicQuestions:
          "In which year did Mohammad Rafi recorded his first song? ",
      musicCorrectAnswerIndex: 0,
      mOptions: [
        "a. 1942",
        "b. 1951",
        "c. 1939",
        "d. 1954",
      ],
    ),

    MusicClass(
      musicQuestions:
          "How many books are there to learn in the basic stages of learning music?",
      musicCorrectAnswerIndex: 0,
      mOptions: [
        "a. 2",
        "b. 4",
        "c. 6",
        "d. 8",
      ],
    ),

    MusicClass(
      musicQuestions:
          "As per Hindustani Music,'Kafi-Thata Janya-Ragas' are divided into how many 'Ragangas' ?",
      musicCorrectAnswerIndex: 2,
      mOptions: [
        "a. 4",
        "b. 3",
        "c. 5",
        "d. 2",
      ],
    ),

    MusicClass(
      musicQuestions: " What is the tune of the song called?",
      musicCorrectAnswerIndex: 1,
      mOptions: [
        "a. Rag",
        "b. Ragan",
        "c. Antara",
        "d. Taal",
      ],
    ),

    MusicClass(
      musicQuestions: " Which is an Indian string instrument?",
      musicCorrectAnswerIndex: 0,
      mOptions: [
        "a. Sitar",
        "b. Violin",
        "c. Piano",
        "d. Guitar",
      ],
    ),

    MusicClass(
      musicQuestions:
          "It is said that Tabla was invented accidentally during a stage performance by an artist. Name the instrument from which Tabla was believed to be invented.",
      musicCorrectAnswerIndex: 1,
      mOptions: [
        "a. Bongo",
        "b. Mridangam",
        "c. Dholak",
        "d. Guitar",
      ],
    ),

    MusicClass(
      musicQuestions: "How many sounds does Tabla produce?",
      musicCorrectAnswerIndex: 2,
      mOptions: [
        "a. 3",
        "b. 4",
        "c. 12",
        "d. 18",
      ],
    ),

    MusicClass(
      musicQuestions:
          "Which one of these Tabla players has received Padma Vibhushan, the second highest civilian award given by the government of India?",
      musicCorrectAnswerIndex: 0,
      mOptions: [
        "a. Zakir Hussain",
        "b. Ustaad Allahrakha",
        "c. Pt. Kishan Maharaj",
        "d. Ustad Abdul Latif",
      ],
    ),

    MusicClass(
      musicQuestions:
          "Who is the youngest Indian singer to win a Filmfare award ?",
      musicCorrectAnswerIndex: 2,
      mOptions: [
        "a. Arijit Singh",
        "b. Neeti Mohan",
        "c. Ankit Tiwari",
        "d. Nazia Hassan",
      ],
    ),
  ];

  // methods

  // to access the question
  String getMusicQuestion() {
    return mQuestions[musicQuestionNumber].musicQuestions;
  }

  // to access the optons

  List getMusicOptions() {
    return mQuestions[musicQuestionNumber].mOptions;
  }

  //to access the correct answer index

  int getMusicCorrectAnswerIndex() {
    return mQuestions[musicQuestionNumber].musicCorrectAnswerIndex;
  }

  // go to next question

  void goToNextQuestion() {
    if (musicQuestionNumber < mQuestions.length - 1) {
      musicQuestionNumber++;
    }
  }

// to check is it is the last question

  bool isLastMusicQuestion() {
    if (musicQuestionNumber == mQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  // to reset quiz
  void resetMusicQuiz() {
    musicQuestionNumber = 0;
  }

  //previous question

  void goToPreviousQuestion() {
    if (musicQuestionNumber > 0) {
      musicQuestionNumber--;
    }
  }
}
