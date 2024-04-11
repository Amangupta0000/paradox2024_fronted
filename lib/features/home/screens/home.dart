import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/features/home/screens/comingsoon.dart';
import 'package:paradox_2024/features/home/screens/question_card_widget.dart';
import 'package:paradox_2024/features/home/screens/timer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    DateTime targetDate = DateTime(2024, 4, 10);
    Duration difference = targetDate.difference(DateTime.now());

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Text(
                'PARADOX',
                style: TextStyle(
                  fontFamily: 'Hermes',
                  fontSize: screenHeight * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFDE34),
                ),
              ),
            ],
          ),
        ),
        Stack(children: [
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.01),
            child: SizedBox(
              height: screenHeight * 0.4,
              child: Image.asset('assets/bottom_nav_bar_icons/score_board.png'),
            ),
          ),
          Positioned(
              top: screenHeight * 0.25,
              left: screenWidth * 0.43,
              child: Text(
                'Name 1',
                style: TextStyle(
                  color: Colors.white,
                    fontSize: screenHeight * 0.015,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Orbitron'),
              )),
          Positioned(
              top: screenHeight * 0.28,
              left: screenWidth * 0.14,
              child: Text(
                'Name 2',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.013,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Orbitron'),
              )),
          Positioned(
              top: screenHeight * 0.305,
              left: screenWidth * 0.74,
              child: Text(
                'Name 3',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.013,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Orbitron'),
              )),
        ]),
        GestureDetector(
          onTap: () {
            print(difference.inDays);
            if (difference.inDays <= 0) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const Question_Screen()));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const CountdownScreen(
                        date: 12,
                      )));
            }
          },
          child: Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.04),
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
              color: Colors.transparent,
            ),
            margin: EdgeInsets.all(screenHeight * 0.015),
            padding: EdgeInsets.all(screenHeight * 0.015),
            child: Center(
              child: Text(
                'LEVEL 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.024,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (difference.inDays <= 0) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const comingsoon()));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const CountdownScreen(
                        date: 13,
                      )));
            }
          },
          child: Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.04),
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
              color: Colors.transparent,
            ),
            margin: EdgeInsets.all(screenHeight * 0.015),
            padding: EdgeInsets.all(screenHeight * 0.015),
            child: Center(
              child: Text(
                'LEVEL 2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.024,
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
