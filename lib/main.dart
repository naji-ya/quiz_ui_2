import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/home_page.dart';
import 'package:flutter_quiz_2/components/styles.dart';
import 'package:flutter_quiz_2/pages/BookQuiz/books.dart';

import 'package:flutter_quiz_2/pages/ComputerQuiz/computer.dart';
import 'package:flutter_quiz_2/pages/HistoryQuiz/history.dart';
import 'package:flutter_quiz_2/pages/MusicQuiz/music.dart';
import 'package:flutter_quiz_2/pages/quiz_home.dart';
import 'package:flutter_quiz_2/pages/ScienceQuiz/science.dart';
import 'package:flutter_quiz_2/pages/SportsQuiz/sports.dart';
import 'package:flutter_quiz_2/screens/log_in_screen.dart';
import 'package:flutter_quiz_2/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fixedSize: const Size(320, 60),
            ),
          ),
        ),
        home: const LoginScreen(),
        routes: {
          'homepage': (context) => const HomePage(),

          // routes for the different quiz pages
          'sports': (context) => const SportsPage(),
          'science': (context) => const SciencePage(),
          'music': (context) => const MusicPage(),
          'history': (context) => const HistoryPage(),
          'computer': (context) => const ComputerPage(),
          'books': (context) => const BooksPage(),
          //Route for back to home button

          'quiz_home': (context) => const QuizHome(),
          'log_in_screen': (context) => const LoginScreen(),
          'register_screen': (context) => const RegisterScreen(),
        });
  }
}
