// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  const MyButtons({
    super.key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    this.onTap,
  });

  final Color color;
  final Color textColor;
  final String buttonText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(color: color),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
