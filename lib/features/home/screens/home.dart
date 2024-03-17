import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          child: IconButton(onPressed: signOut, icon: Icon(Icons.logout)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Question_Screen()));
          },
          child: Container(
            height: 60,
            width: 100,
            color: Colors.red,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            child: Text(
              'LEVEL 1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 100,
            color: Colors.red,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            child: Text(
              'LEVEL 2',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
