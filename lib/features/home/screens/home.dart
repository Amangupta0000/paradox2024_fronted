import 'package:flutter/material.dart';
import 'package:paradox_2024/features/home/screens/comingsoon.dart';
import 'package:paradox_2024/features/home/screens/question_card_widget.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    DateTime targetDate = DateTime(2024, 4, 12);
    Duration difference = targetDate.difference(DateTime.now());

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 2,
                child: Text(
                  'PARADOX',
                  style: TextStyle(
                    fontFamily: 'Hermes',
                    fontSize: screenHeight * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff802C95),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 0,
                child: Text(
                  'PARADOX',
                  style: TextStyle(
                    fontFamily: 'Hermes',
                    fontSize: screenHeight * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff802C95),
                  ),
                ),
              ),
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
                MaterialPageRoute(builder: (ctx) => const Question_Screen()));
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const comingsoon()));
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
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.01),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.03),
                color: Colors.grey,
              ),
              padding: EdgeInsets.all(screenHeight * 0.007),
              child: Column(
                children: [
                  Text(
                    'LEVEL 1 STARTS IN :',
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      color: Color(0xFFFFDE34),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.004),
                  TimerCountdown(
                    format: CountDownTimerFormat.daysHoursMinutesSeconds,
                    endTime: DateTime.now().add(difference),
                    onEnd: () {
                      print("Timer finished");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
