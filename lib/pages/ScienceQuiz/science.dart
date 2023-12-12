import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SciencePage extends StatefulWidget {
  const SciencePage({super.key});

  @override
  State<SciencePage> createState() => _SciencePageState();
}

class _SciencePageState extends State<SciencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: IconButton(
                onPressed: () {
                  Alert(
                      context: context,
                      title: "Do you want to exit ?",
                      style: AlertStyle(
                        alertBorder: Border.all(
                          color: Colors.amber,
                        ),
                        backgroundColor: Colors.black,
                        titleStyle:
                            const TextStyle(color: Colors.white, fontSize: 22),
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
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            " Science",
            style: GoogleFonts.akshar(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: const [
          
        ],
      ),
    );
  }
}
