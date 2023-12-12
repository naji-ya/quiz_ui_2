import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/card_containers.dart';
import 'package:flutter_quiz_2/components/card_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // fuctions to navigate to its corresponding quiz page as the user click on each container
  void onClicked(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, 'sports');
    } else if (index == 1) {
      Navigator.pushNamed(context, 'science');
    } else if (index == 2) {
      Navigator.pushNamed(context, 'music');
    } else if (index == 3) {
      Navigator.pushNamed(context, 'history');
    } else if (index == 4) {
      Navigator.pushNamed(context, 'computer');
    } else if (index == 5) {
      Navigator.pushNamed(context, 'books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: (() {
              Navigator.pushNamed(context, 'quiz_home');
            }),
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            "QuizyApp",

            // used google fonts from the package
            style: GoogleFonts.akshar(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 45.0, bottom: 45.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      // reusabele container widget
                      child: CardContainer(
                        onTap: () {
                          onClicked(0);
                        },

                        // icon cards is a reusable widget which requires  an icon widget and iconchild
                        iconCard: const IconCards(
                          iconWidget: Icons.sports_volleyball,
                          iconChild: "Sports",
                        ),
                      ),
                    ),
                    Expanded(
                      // reusabele container widget
                      child: CardContainer(
                        onTap: () {
                          onClicked(1);
                        },

                        // icon cards is a reusable widget which requires  an icon widget and iconchild
                        iconCard: const IconCards(
                          iconWidget: Icons.science,
                          iconChild: "Science",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      // reusabele container widget
                      child: CardContainer(
                        onTap: () {
                          onClicked(2);
                        },
                        // icon cards is a reusable widget which requires  an icon widget and iconchild

                        iconCard: const IconCards(
                          iconWidget: Icons.music_note,
                          iconChild: "Music",
                        ),
                      ),
                    ),
                    Expanded(
                      // reusabele container widget
                      child: CardContainer(
                        onTap: () {
                          onClicked(3);
                        },

                        // icon cards is a reusable widget which requires  an icon widget and iconchild

                        iconCard: const IconCards(
                          iconWidget: Icons.history,
                          iconChild: "History",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    // reusabele container widget
                    child: CardContainer(
                      onTap: () {
                        onClicked(4);
                      },

                      // icon cards is a reusable widget which requires  an icon widget and iconchild

                      iconCard: const IconCards(
                        iconWidget: Icons.computer_rounded,
                        iconChild: "Computer ",
                      ),
                    ),
                  ),
                  Expanded(
                    // reusabele container widget
                    child: CardContainer(
                      onTap: () {
                        onClicked(5);
                      },

                      // icon cards is a reusable widget which requires  an icon widget and iconchild

                      iconCard: const IconCards(
                        iconWidget: Icons.library_books,
                        iconChild: "Books",
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ));
  }
}
