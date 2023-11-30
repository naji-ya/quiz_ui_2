import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final VoidCallback onTap;
  const PreviousButton({super.key, required this.onTap});

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
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              child: const Center(
                  child: Text(
                "Previous",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
