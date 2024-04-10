import 'package:flutter/material.dart';

class LevelCompleteScreen extends StatelessWidget {
  const LevelCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Congratulation!! you have completed the level 1",
              style: TextStyle(
                fontFamily: 'Hermes',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFDE34),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
