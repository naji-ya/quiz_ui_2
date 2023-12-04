import 'package:flutter/material.dart';

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
      child: const Text(
        "Play Quiz",
        style: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
