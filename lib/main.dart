import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/home_page.dart';
import 'package:flutter_quiz_2/pages/books.dart';
import 'package:flutter_quiz_2/pages/computer.dart';
import 'package:flutter_quiz_2/pages/games.dart';
import 'package:flutter_quiz_2/pages/music.dart';
import 'package:flutter_quiz_2/pages/quiz_home.dart';
import 'package:flutter_quiz_2/pages/science.dart';
import 'package:flutter_quiz_2/pages/sports.dart';

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
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fixedSize: const Size(250, 60),
            ),
          ),
        ),
        home: const QuizHome(),
        routes: {
          'homepage': (context) => const HomePage(),

          // routes for the different quiz pages
          'sports': (context) => const SportsPage(),
          'science': (context) => const SciencePage(),
          'music': (context) => const MusicPage(),
          'games': (context) => const GamesPage(),
          'computer': (context) => const ComputerPage(),
          'books': (context) => const BooksPage(),
        });
  }
}
