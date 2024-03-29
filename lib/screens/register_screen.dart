import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/divider.dart';
import 'package:flutter_quiz_2/components/square_image.dart';
import 'package:flutter_quiz_2/components/styles.dart';

class RegisterScreen extends StatefulWidget {
  Function()? onTap;
  RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
//text controllers

  final emailController = TextEditingController();
  final passWordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void userSignUp() async {
// show  loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: buttonColor,
          ),
        );
      },
    );

// try sign in
    try {
      // the password is equal to confirm passwored
      if (passWordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passWordController.text,
        );
      } else {
        // pop the loading circle
        Navigator.pop(context);
        // show error message
        showErrorMessage("Password dont match!");
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show the corresponding error message
      showErrorMessage(e.code);
    }
  }

//used showerrormessage function to reduce the complexity of the program and understand easily
  //  error popup message

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });

        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 240, 218, 151),
          title: Text(
            message,
            style: TextStyle(color: textOneColor),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 150,
                      child: Image.asset("assets/register2.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      right: 180.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: buttonColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Email

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white10,
                        hintText: "Email",
                        hintStyle: const TextStyle(
                            color: Colors.grey, letterSpacing: 0.5),
                      ),
                      style: TextStyle(color: textColor, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  //password

                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: passWordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white10,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: Colors.grey, letterSpacing: 0.5),
                      ),
                      style: TextStyle(color: textColor, fontSize: 15),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //confirm password

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: !isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white10,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: " Confirm Password",
                        hintStyle: const TextStyle(
                            color: Colors.grey, letterSpacing: 0.5),
                      ),
                      style: TextStyle(color: textColor, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
// sign up button
                  ElevatedButton(
                    onPressed: userSignUp,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttonColor),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: textOneColor, fontSize: 20),
                    ),
                  ),
                  //or continue with
                  const SizedBox(
                    height: 30,
                  ),
// reusable divider page
                  const DividerPage(),

                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      // google button
                      SquareImage(imageSource: "assets/google.png"),
                      SizedBox(
                        width: 20,
                      ),

                      // apple button

                      SquareImage(imageSource: "assets/apple.png"),
                      SizedBox(
                        width: 20,
                      ),

                      // facebook button

                      SquareImage(imageSource: "assets/facebook-48.png"),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account ?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: buttonColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
