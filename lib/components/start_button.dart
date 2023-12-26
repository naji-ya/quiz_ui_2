import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/styles.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    // elevatedbutton is used to navigate or start the quiz to categories page
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'homepage');
      },
      child: Text(
        "Play Quiz",
        style: TextStyle(
            fontSize: 20, color: textOneColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
