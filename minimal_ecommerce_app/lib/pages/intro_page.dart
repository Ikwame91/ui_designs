import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_ecommerce_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 120,
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
            Text(
              'Your one stop shop for all things minimal',
              style: GoogleFonts.bebasNeue(
                textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
            ),
            MyButton(
                child: const Icon(Icons.arrow_forward),
                onTap: () => Navigator.pushNamed(context, '/shop_page')),
          ],
        ),
      ),
    );
  }
}
