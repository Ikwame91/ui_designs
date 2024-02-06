import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.onTap, required this.child});
  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
