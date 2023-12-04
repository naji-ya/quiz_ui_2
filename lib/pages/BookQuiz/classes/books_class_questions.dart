import 'package:flutter_quiz_2/pages/BookQuiz/classes/books_class.dart';

class BooksQBank {
  int booksQuestionNumber = 0;
  // list of question ,options,correctanswer index with list type BooksClass

  List<BooksClass> bQuestions = [
    BooksClass(
      booksQuestions: "Whose autobiography is 'Wings of Fire'?",
      booksCorrectAnswerIndex: 3,
      bOptions: [
        "a. Dr.Samuel Johnson",
        "b. Rabindranath Tagore",
        "c. Gandhiji",
        "d. Dr.A.P.J Abdul Kalam",
      ],
    ),
    BooksClass(
      booksQuestions: "Who wrote the famous book 'We the people'? ",
      booksCorrectAnswerIndex: 3,
      bOptions: [
        "a. T.N.Kaul",
        "b. J.R.D.Tata",
        "c. Khuswant Singh ",
        "d. Nani Palkivala"
      ],
    ),
    BooksClass(
      booksQuestions: "Who is the author of the book New India?",
      booksCorrectAnswerIndex: 1,
      bOptions: [
        "a. Manik Bandopadhyay",
        "b. Annie Besant",
        "c. John Milton",
        "d. None"
      ],
    ),
    BooksClass(
      booksQuestions:
          " Name That Book: What is the seventh and final installment in J. K. Rowling’s Harry Potter series?",
      booksCorrectAnswerIndex: 3,
      bOptions: [
        "a .Harry Potter and the Order of the Phoenix",
        "b. Harry Potter and the Half-Blood Prince",
        "c. Harry Potter and the Cursed Child",
        "d. Harry Potter and the Deathly Hallows"
      ],
    ),
    BooksClass(
      booksQuestions: "How many acts are in Romeo and Juliet?",
      booksCorrectAnswerIndex: 3,
      bOptions: [
        "a. Two ",
        "b. Three",
        "c. Four",
        "d. Five ",
      ],
    ),
    BooksClass(
      booksQuestions: "Who is the father of English Poetry?",
      booksCorrectAnswerIndex: 2,
      bOptions: [
        "a. Milton ",
        "b. Wordsworth",
        "c. Chaucer",
        "d. Charles Dickens",
      ],
    ),
    BooksClass(
      booksQuestions:
          "Who among the following is the author of 'The Brahma Sutra - The philosophy of Spiritual Life '?",
      booksCorrectAnswerIndex: 0,
      bOptions: [
        "a. Sarvepalli Radhakrishnan",
        "b. Indira Gandhi",
        "c. Sarojini Naidu",
        "d. Rajendra Prasad",
      ],
    ),
    BooksClass(
      booksQuestions:
          "E.L. James’s Fifty Shades of Grey was originally fan fiction for which book series?",
      booksCorrectAnswerIndex: 0,
      bOptions: [
        "a. The Twilight Series",
        "b. The Harry Potter Series",
        "c. The Outlander Series",
        "d. The Left Behind Series"
      ],
    ),
    BooksClass(
      booksQuestions: "Which is RK Narayan's first novel?",
      booksCorrectAnswerIndex: 0,
      bOptions: [
        "a. Swami and Friends",
        "b. The Guide",
        "c. The English Teacher",
        "d. Malgudi Days",
      ],
    ),
    BooksClass(
      booksQuestions:
          "Who wrote the line: ' A thing of beauty is a joy forever'?",
      booksCorrectAnswerIndex: 0,
      bOptions: [
        "a. John Keats ",
        "b. Robert Browing",
        "c. P.B.Shelley",
        "d. William Wordsworth",
      ],
    ),
  ];


//previous button method
  void getPreviousBookQuestion() {
    if (booksQuestionNumber > 0) {
      booksQuestionNumber--;
    }
  }

//method to check whether the question is last or not
  bool isLastBookQuestion() {
    if (booksQuestionNumber == bQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }
//to get the questions from the list to the book.dart page
  String getBookQuestions() {
    return bQuestions[booksQuestionNumber].booksQuestions;
  }


//to get the options from the list to the book.dart page
  List getBooksOptions() {
    return bQuestions[booksQuestionNumber].bOptions;
  }


//to get the correct  answer index from the list to the book.dart page
  int correctBookAnswer() {
    return bQuestions[booksQuestionNumber].booksCorrectAnswerIndex;
  }

// method to reset  quiz
  void resetQuiz() {
    booksQuestionNumber = 0;
  }

  // go to next question
  void getNextQuestion() {
    if (booksQuestionNumber < bQuestions.length - 1) {
      booksQuestionNumber++;
    }
  }
}
