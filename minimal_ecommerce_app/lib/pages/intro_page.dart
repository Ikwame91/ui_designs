import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Column(
        children: [
          //logo
          Icon(
            Icons.shopping_bag,
            size: 75,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(height: 20),

          //title
          const Text(
            'Minimal Ecommerce',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          //subtitle
          const Text(
            'Your one stop shop for all things minimal',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          MyButton(child: const Icon(Icons.arrow_forward), onTap: () {}),
        ],
      ),
    );
  }
}
