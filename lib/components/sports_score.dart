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
        automaticallyImplyLeading: false,
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
                  height: 50,
                ),
                Text(
                  "Your Score ",
                  style: GoogleFonts.abyssinicaSil(
                      color: Colors.white, fontSize: 23),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$score/10",
                  style: GoogleFonts.abyssinicaSil(
                      letterSpacing: 3,
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'quiz_home');
                  },
                  child: const Text(
                    "Back To Home ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
