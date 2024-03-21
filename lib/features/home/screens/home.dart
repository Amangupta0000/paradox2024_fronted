import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paradox_2024/features/home/screens/comingsoon.dart';
import 'package:paradox_2024/features/home/screens/question_card_widget.dart';
import 'package:figma_squircle/figma_squircle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    signOut() async {
      FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.signOut();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 400),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Question_Screen()));
          },
          child: Container(
            height: 60,
            width: 400,
            decoration: ShapeDecoration(
              color: Colors.red.withOpacity(0.75),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 30,
                  cornerSmoothing: 1,
                ),
              ),
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            child: const Center(
              child: Text(
                'LEVEL 1',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const comingsoon()));
          },
          child: Container(
            height: 60,
            width: 400,
            decoration: ShapeDecoration(
              color: Colors.red.withOpacity(0.75),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 30,
                  cornerSmoothing: 1,
                ),
              ),
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            child: const Center(
              child: Text(
                'LEVEL 2',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
