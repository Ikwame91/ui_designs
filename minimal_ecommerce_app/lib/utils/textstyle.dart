import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style extends StatelessWidget {
  final TextStyle customStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );

  final TextStyle stylishhhh = GoogleFonts.enriqueta(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  final TextStyle secondStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  );

  Style({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the text styles here
    return Container();
  }
}
