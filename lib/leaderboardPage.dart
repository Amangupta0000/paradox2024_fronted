import 'package:flutter/material.dart';

class leaderboardPage extends StatefulWidget {
  const leaderboardPage({Key? key}) : super(key: key);

  @override
  State<leaderboardPage> createState() => _leaderboardPageState();
}

class _leaderboardPageState extends State<leaderboardPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
            SizedBox(
              height: screenHeight * 0.1,
              child: Image.asset('assets/leaderboard_text.png'),
            ),
            Stack(
              children: [
                SizedBox(
                  height: screenHeight * 0.65,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/leaderboard_bg.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
