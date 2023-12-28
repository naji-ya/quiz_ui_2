import 'package:flutter/material.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Expanded(
        child: Divider(
          thickness: 0.3,
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
          thickness: 0.3,
          color: Colors.grey,
        ),
      ),
    ]);
  }
}
