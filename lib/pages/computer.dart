import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComputerPage extends StatefulWidget {
  const ComputerPage({super.key});

  @override
  State<ComputerPage> createState() => _ComputerPageState();
}

class _ComputerPageState extends State<ComputerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Quiz On Computer",
          style: GoogleFonts.akshar(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
