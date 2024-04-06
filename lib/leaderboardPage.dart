import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  SizedBox(
                    height: screenHeight * 0.6,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/leaderboard_bg.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.18,
                    left: screenWidth * 0.08,
                    child: Text(
                      'Aman',
                      style: TextStyle(
                        fontFamily: 'Hermes',
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.21,
                    left: screenWidth * 0.28,
                    child: Text(
                      'Devender',
                      style: TextStyle(
                        fontFamily: 'Hermes',
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.17,
                    left: screenWidth * 0.58,
                    child: Text(
                      'Rishab',
                      style: TextStyle(
                        fontFamily: 'Hermes',
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.27,
                    left: screenWidth * 0.08,
                    child: SizedBox(
                      height: screenHeight * 0.4,
                      width: screenWidth * 0.8,
                      child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (ctx, idx) {
                            return Stack(
                              children: [
                                Container(
                                  height: screenHeight * 0.08,
                                  child: Image.asset(
                                    'assets/leaderboard_tile.png',
                                  ),
                                ),
                                Positioned(
                                  top: screenHeight * 0.022,
                                  left: screenWidth * 0.04,
                                  child: Row(
                                    children: [
                                      Text(
                                        idx.toString(),
                                        style: TextStyle(
                                          // fontFamily: 'Hermes',
                                          fontSize: screenHeight * 0.016,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.21,
                                      ),
                                      Text(
                                        'Aman Gupta',
                                        style: TextStyle(
                                          fontFamily: 'Hermes',
                                          fontSize: screenHeight * 0.022,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.08,
                                      ),
                                      Text(
                                        'Level 1',
                                        style: TextStyle(
                                          // fontFamily: 'Hermes',
                                          fontSize: screenHeight * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
