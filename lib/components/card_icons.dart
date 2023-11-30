import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconCards extends StatelessWidget {
  final IconData iconWidget;
  final String iconChild;
  const IconCards({
    super.key,
    required this.iconWidget,
    required this.iconChild,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Icon(
            iconWidget,
            size: 75,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          iconChild,
          style: GoogleFonts.akshar(
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
