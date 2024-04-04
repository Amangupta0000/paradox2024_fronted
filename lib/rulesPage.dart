import 'package:flutter/material.dart';

class rulesPage extends StatelessWidget {
  const rulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
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
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 2,
                  child: Text(
                    'RULES',
                    style: TextStyle(
                      fontFamily: 'Hermes',
                      fontSize: screenHeight * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff802C95),
                    ),
                  ),
                ),
                Positioned(
                  top: 2,
                  left: 0,
                  child: Text(
                    'RULES',
                    style: TextStyle(
                      fontFamily: 'Hermes',
                      fontSize: screenHeight * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff802C95),
                    ),
                  ),
                ),
                Text(
                  'RULES',
                  style: TextStyle(
                    fontFamily: 'Hermes',
                    fontSize: screenHeight * 0.05,
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
              height: screenHeight * 0.5,
              child: Image.asset(
                'assets/rules.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
