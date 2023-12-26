import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/square_image.dart';
import 'package:flutter_quiz_2/components/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  //text controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                // username
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: buttonColor),
                      ),
                      hintText: "Username",
                      hintStyle: const TextStyle(
                          color: Colors.grey, letterSpacing: 0.5),
                    ),
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
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10),
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'quiz_home');
                  },
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

                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      " Or continue with ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

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
