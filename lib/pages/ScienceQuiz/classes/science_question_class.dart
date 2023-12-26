import 'package:flutter_quiz_2/pages/ScienceQuiz/classes/science_class.dart';

class ScienceQBank {
  int scienceQuestionNumber = 0;
// create questions ,options and correct answer index in a list

  List<ScienceClass> seQuestions = [
// constructor of ScienceClass

    ScienceClass(
      scienceQuestions:
          "Which of the following is a non-metal that remains liquid at room temperature?",
      scienceCorrectAnswerIndex: 1,
      scienceOptions: [
        "a. Phosphorous",
        "b. Bromine",
        "c. Chlorine",
        "d. Helium",
      ],
    ),

    ScienceClass(
      scienceQuestions: "Which of the following is used in pencils?",
      scienceCorrectAnswerIndex: 0,
      scienceOptions: [
        "a. Graphite",
        "b. Silicon",
        "c. Charcoal",
        "d. Phosphorous",
      ],
    ),

    ScienceClass(
      scienceQuestions: "The element common to all acids is",
      scienceCorrectAnswerIndex: 0,
      scienceOptions: [
        "a. Hydrogen",
        "b. Carbon",
        "c. Sulphur",
        "d. Oxygen",
      ],
    ),

    ScienceClass(
      scienceQuestions:
          " Which particular amoeba causes Amoebiasis, also known amoebic dysentery?",
      scienceCorrectAnswerIndex: 3,
      scienceOptions: [
        "a. Dictyostelium",
        "b. Naegleria",
        "c. Pelomyxa",
        "d. Entamoeba",
      ],
    ),

    ScienceClass(
      scienceQuestions:
          "Zika virus was named after the Zika Forest of which country?",
      scienceCorrectAnswerIndex: 3,
      scienceOptions: [
        "a. Nigeria",
        "b. Angola",
        "c. Nicaragua",
        "d. Uganda",
      ],
    ),

    ScienceClass(
      scienceQuestions: "Which of the following is an element?",
      scienceCorrectAnswerIndex: 3,
      scienceOptions: [
        "a. Ruby",
        "b. Sapphire",
        "c. Emerald",
        "d. Diamond",
      ],
    ),

    ScienceClass(
      scienceQuestions: "Balloons are filled with",
      scienceCorrectAnswerIndex: 1,
      scienceOptions: [
        "a. Nitrogen",
        "b. Helium",
        "c. Oxygen",
        "d. Argon",
      ],
    ),

    ScienceClass(
      scienceQuestions:
          "Name the chemical that is responsible for the yellow colour of urine",
      scienceCorrectAnswerIndex: 0,
      scienceOptions: [
        "a. Urobilin",
        "b. Creatinine",
        "c. Heamoglobin",
        "d. Methylene",
      ],
    ),

    ScienceClass(
      scienceQuestions: "Potassium nitrate is used in",
      scienceCorrectAnswerIndex: 1,
      scienceOptions: [
        "a. Medicine",
        "b. Fertiliser",
        "c. Salt",
        "d. Gas",
      ],
    ),

    ScienceClass(
      scienceQuestions: "Chandrayaan-2 Mission was launched by which vehicle?",
      scienceCorrectAnswerIndex: 0,
      scienceOptions: [
        "a. GSLV MkIII",
        "b. PSLV C11",
        "c. GSLV F11",
        "d. PSLV C45",
      ],
    ),
  ];

  //methods

  // to get question from the list

  String getScienceQuestion() {
    return seQuestions[scienceQuestionNumber].scienceQuestions;
  }

  // to get options from the list

  List getScienceOptions() {
    return seQuestions[scienceQuestionNumber].scienceOptions;
  }

  // to reset the quiz

  void resetScienceQuiz() {
    scienceQuestionNumber = 0;
  }

  // to check is it is last question

  bool isLastScienceQuestion() {
    if (scienceQuestionNumber == seQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  // to go to next question

  void goToNextScienceQuestion() {
    if (scienceQuestionNumber < seQuestions.length - 1) {
      scienceQuestionNumber++;
    }
  }

  //to go back to previous Question

  void goToPreviousScienceQuestion() {
    if (scienceQuestionNumber > 0) {
      scienceQuestionNumber--;
    }
  }

  // to get correct Answer index

  int getCorrectScienceAnswerIndex() {
    return seQuestions[scienceQuestionNumber].scienceCorrectAnswerIndex;
  }
}
