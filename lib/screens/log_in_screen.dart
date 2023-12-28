import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/divider.dart';
import 'package:flutter_quiz_2/components/square_image.dart';
import 'package:flutter_quiz_2/components/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool isPasswordVisible = false;

  //text editing  controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void userSignIn() async {
// show  loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
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

      // wrong email
      if (e.code == 'user-not-found') {
        showErrorEmailMessage();
      }

      //wrong password
      if (e.code == 'wrong-password') {
        showErrorPasswordMessage();
      }
    }
  }

  // wrong email popup

  void showErrorEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });

        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 240, 218, 151),
          title: Text(
            "Email is incorrect!",
            style: TextStyle(color: textOneColor),
          ),
        );
      },
    );
  }

  // wrong password popup

  void showErrorPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Password is incorrect!"),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
                  height: 170,
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
                        fontSize: 20,
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
                      fontSize: 17,
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
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: buttonColor),
                      ),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                          color: Colors.grey, letterSpacing: 0.5),
                    ),
                    onChanged: (_) {
                      _emailFocusNode.requestFocus();
                    },
                    style: TextStyle(color: textColor, fontSize: 15),
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
                    focusNode: _passwordFocusNode,
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          color: Colors.grey, letterSpacing: 0.5),
                    ),
                    onChanged: (_) {
                      _passwordFocusNode.requestFocus();
                    },
                    style: TextStyle(color: textColor, fontSize: 15),
                  ),
                ),
                // forgot password
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Colors.grey),
                    )
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
                      onTap: () {
                        Navigator.pushNamed(context, 'register_screen');
                      },
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
