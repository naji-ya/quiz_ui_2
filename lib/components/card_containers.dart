import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Widget iconCard;

  const CardContainer({
    super.key,
    required this.iconCard,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8),
        ),
        child: iconCard,
      ),
    );
  }
}
