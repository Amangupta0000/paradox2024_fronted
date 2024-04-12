import 'package:flutter/material.dart';

import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:paradox_2024/features/home/screens/level2/qr_screen.dart.dart';
import 'package:paradox_2024/features/home/screens/question_card_widget.dart';

class CountdownScreen extends StatelessWidget {
  const CountdownScreen({super.key, required this.date});
  final int date;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    DateTime targetDate = DateTime(2024, 4, date, 11);
    Duration difference = targetDate.difference(DateTime.now());
    int level = (date == 12) ? 1 : 2;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
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
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.05),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenHeight * 0.03),
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.all(screenHeight * 0.007),
                    child: Column(
                      children: [
                        Text(
                          'LEVEL $level STARTS IN :',
                          style: TextStyle(
                            fontSize: screenHeight * 0.019,
                            color: Color(0xFFFFDE34),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.004),
                        TimerCountdown(
                          format: CountDownTimerFormat.daysHoursMinutesSeconds,
                          endTime: DateTime.now().add(difference),
                          onEnd: () {
                            if (date == 12) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const Question_Screen()));
                            } else {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => const QRScreen()));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
