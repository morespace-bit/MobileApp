import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 58, 243),
      ),
      onPressed: onTap,
      child: Text("$text", style: TextStyle(fontSize: 15, color: Colors.white)),
    );
  }
}
