import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
        automaticallyImplyLeading: false,
        title: Text(
          "Quiz On Computer",
          style: GoogleFonts.akshar(
            color: Colors.amber,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: IconButton(
                onPressed: () {
                  Alert(
                      context: context,
                      title: "Alert!",
                      style: AlertStyle(
                        alertBorder: Border.all(
                          color: Colors.amber,
                        ),
                        backgroundColor: Colors.black,
                        titleStyle:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      content: Column(
                        children: const [
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Do you  want to exit ?              ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Your current score will loose if you exit now",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'homepage');
                          },
                          color: Colors.amber,
                          child: const Text(
                            "OK",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DialogButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.amber,
                          child: const Text(
                            "NO",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]).show();
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                )),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
