import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../components/divider.dart';
import '../components/square_image.dart';
import '../components/styles.dart';

class LoginScreen extends StatefulWidget {
  Function()? onTap;
  LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

const List<String> scopes = <String>[
  'email',
];

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  //text editing  controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    clientId:
        '621908092432-cj0sbrjf99b9besl7vhfd9otblt9vp6k.apps.googleusercontent.com',
    scopes: scopes,
  );

  @override
  void initState() {
    super.initState();
  }

  void userSignIn() async {
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
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
//combines it with the above code  so it will be more accurate
  // // wrong password popup

  // void showErrorPasswordMessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         title: Text("Password is incorrect!"),
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  child: Image.asset(
                    "assets/login.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    right: 230.0,
                    bottom: 5.0,
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(right: 120.0, bottom: 10.0, left: 20),
                  child: Text(
                    "Please login to continue",
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 190, 190),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: buttonColor),
                      ),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                          color: Colors.grey, letterSpacing: 0.5),
                    ),
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
//password

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 20),
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          color: Colors.grey, letterSpacing: 0.5),
                    ),
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),
                ),
                // forgot password
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'forgot_password');
                      },
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                // SIGN IN BUTTON

                ElevatedButton(
                  onPressed: userSignIn,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text(
                    "Login",
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
                  children: [
                    // google button
                    GestureDetector(
                      onTap: () async {
                        try {
                          await _googleSignIn.signIn();
                        } catch (error) {
                          print(error);
                        }
                      },
                      child: const SquareImage(
                        imageSource: "assets/google.png",
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),

                    // apple button
                    const SquareImage(imageSource: "assets/apple.png"),
                    const SizedBox(
                      width: 20,
                    ),

                    // facebook button
                    const SquareImage(imageSource: "assets/facebook-48.png"),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register now",
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
      ),
    );
  }
}
