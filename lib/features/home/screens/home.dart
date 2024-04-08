import 'package:flutter/material.dart';
import 'package:paradox_2024/features/home/screens/timer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    DateTime targetDate = DateTime(
      2024,
      4,
      12
    );
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
        Padding(
          padding: EdgeInsets.all(screenHeight * 0.01),
          child: SizedBox(
            height: screenHeight * 0.4,
            child: Image.asset('assets/bootom_nav_bar_icons/score_board.png'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const CountdownScreen(date: 13,)));
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
             Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const CountdownScreen(date: 14,)));
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
