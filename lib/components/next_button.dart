import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/pages/sports.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 70,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              child: Center(
                  child: Text(
                sportsqbank.isLastQuestion() ? 'Done' : 'Next',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ],
    );
  }
}