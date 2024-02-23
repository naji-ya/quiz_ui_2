import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_2/components/styles.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _emailController = TextEditingController();
  bool isResetting = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  // to get reset password link through email

  Future<void> passwordReset() async {
    setState(() {
      isResetting = true;
    });
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password reset link send ! check your email",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error:$error'),
        ),
      );
    }
    setState(() {
      isResetting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your email to reset password",
              style: TextStyle(color: textColor, fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
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
                hintStyle:
                    const TextStyle(color: Colors.grey, letterSpacing: 0.5),
              ),
              style: TextStyle(color: textColor, fontSize: 14),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: isResetting ? null : passwordReset,
              child: isResetting
                  ? const CircularProgressIndicator()
                  : Text(
                      "Continue",
                      style: TextStyle(color: textOneColor, fontSize: 20),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
