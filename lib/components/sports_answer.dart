import 'package:flutter/material.dart';

class SportsAnswers extends StatelessWidget {
  final String sportsQuestion;
  final bool isSelected;
  final int? sportsCorrectAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;
  const SportsAnswers({
    super.key,
    required this.sportsQuestion,
    required this.isSelected,
    required this.sportsCorrectAnswerIndex,
    required this.selectedAnswerIndex,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == sportsCorrectAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 8, top: 8),
      child: Container(),
    );
  }
}
