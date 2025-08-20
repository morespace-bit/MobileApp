import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroWidget extends StatelessWidget {
  final String text;
  const HeroWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(18),
      child: Hero(
        tag: 'hero1',
        child: SizedBox(
          height: 345,
          child: Stack(
            children: [
              Image.asset(
                'assets/img/login.jpg',
                height: 345,
                fit: BoxFit.cover,

                color: Colors.blue,
                colorBlendMode: BlendMode.darken,
              ),

              Center(
                child: Text(
                  "$text in to your \n Account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 32,
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
