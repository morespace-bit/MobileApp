import 'package:flutter/material.dart';

class CustomWith extends StatelessWidget {
  const CustomWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Image.asset('assets/img/apple.png', width: 30, height: 30),
              SizedBox(width: 5),

              Text("Apple"),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Image.asset('assets/img/google.png', width: 30, height: 30),
              SizedBox(width: 5),

              Text("Google"),
            ],
          ),
        ),
      ],
    );
  }
}
