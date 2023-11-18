import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'homepage');
      },
      child: const Text(
        "Let's Start",
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
