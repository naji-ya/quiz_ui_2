import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SportsScore extends StatelessWidget {
  final int score;
  const SportsScore({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Score"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amber,
                    ),
                    borderRadius: BorderRadius.circular(160),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/trophy1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Congradulations🎉",
                  style: GoogleFonts.abyssinicaSil(
                      color: Colors.white, fontSize: 35),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  " You are successfully  ",
                  style: GoogleFonts.abyssinicaSil(
                      color: const Color.fromARGB(255, 167, 161, 161),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "completed the Quiz",
                  style: GoogleFonts.abyssinicaSil(
                      color: const Color.fromARGB(255, 167, 161, 161),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Your Score: $score",
                  style: GoogleFonts.abyssinicaSil(
                      color: Colors.white, fontSize: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
