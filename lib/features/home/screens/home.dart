import 'package:flutter/material.dart';
import 'package:paradox_2024/features/home/screens/level2/qr_screen.dart.dart';
import 'package:paradox_2024/features/home/screens/level2/question_screen.dart';
import 'package:paradox_2024/features/home/screens/question_card_widget.dart';
import 'package:paradox_2024/features/home/screens/timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    DateTime level1Time = DateTime(2024, 4, 12, 11, 30);
    DateTime level2Time = DateTime(2024, 4, 12, 11, 25);
    Duration difference = level1Time.difference(DateTime.now());
    Duration difference1 = level2Time.difference(DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
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
          Stack(children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.01),
              child: SizedBox(
                height: screenHeight * 0.4,
                child:
                    Image.asset('assets/score_board.png'),
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
              print(difference.inHours);
              print(difference.inHours);
              if (difference.inMinutes <= 0) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const Question_Screen()));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => CountdownScreen(
                          date: 12,
                          time1: level1Time,
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
              margin: EdgeInsets.all(screenHeight * 0.018),
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
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              int index = pref.getInt("index") ?? 0;
              print(difference1.inMinutes);
              if (difference1.inMinutes <= 0) {
                if (index < 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const Question_Screen_Level2()));
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const QRScreen()));
                }
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => CountdownScreen(
                          date: 13,
                          time1: level2Time,
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
      ),
    );
  }
}
