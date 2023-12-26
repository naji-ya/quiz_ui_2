import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  final String imageSource;
  const SquareImage({super.key, required this.imageSource});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 249, 216, 108),
        ),
      ),
      child: Image.asset(
        imageSource,
        
      ),
    );
  }
}
