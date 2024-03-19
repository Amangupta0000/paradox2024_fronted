import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paradox_2024/features/home/screens/comingsoon.dart';
import 'package:paradox_2024/features/home/screens/question_card_widget.dart';

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
        Center(
          child: IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ),
        const SizedBox(height: 200),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Question_Screen()));
          },
          child: Container(
            height: 60,
            width: 100,
            color: Colors.red,
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
            width: 100,
            color: Colors.red,
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
        )
      ],
    );
  }
}
