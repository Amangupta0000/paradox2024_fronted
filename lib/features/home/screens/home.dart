import 'package:flutter/material.dart';
import 'package:paradox_2024/features/home/screens/comingsoon.dart';
import 'package:paradox_2024/features/home/screens/question_card_widget.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime targetDate = DateTime(2024, 4, 12);
    Duration difference = targetDate.difference(DateTime.now());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 2,
                child: Text(
                  'PARADOX',
                  style: TextStyle(
                    fontFamily: 'Hermes',
                    fontSize: 60,
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
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff802C95),
                  ),
                ),
              ),
              Text(
                'PARADOX',
                style: TextStyle(
                  fontFamily: 'Hermes',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFDE34),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 350,
            child: Image.asset('assets/bootom_nav_bar_icons/score_board.png'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const Question_Screen()));
          },
          child: Container(
            height: 60,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
              color: Colors.transparent,
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            child: const Center(
              child: Text(
                'LEVEL 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
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
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
              color: Colors.transparent,
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            child: const Center(
              child: Text(
                'LEVEL 2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'LEVEL 1 STARTS IN :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFDE34),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
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
      ],
    );
  }
}
