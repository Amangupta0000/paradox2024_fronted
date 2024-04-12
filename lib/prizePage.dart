import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class prizePage extends StatelessWidget {
  const prizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
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
          ),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: screenHeight * 0.5,
                child: Image.asset(
                  'assets/prizes.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
                top: screenHeight * 0.22,
                left: screenWidth * 0.33,
                child: Text(
                  'Rs. 2000',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Orbitron'),
                )),
            Positioned(
                top: screenHeight * 0.34,
                left: screenWidth * 0.08,
                child: Text(
                  'Rs. 1200',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Orbitron'),
                )),
            Positioned(
                top: screenHeight * 0.38,
                left: screenWidth * 0.6,
                child: Text(
                  'Rs. 800',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Orbitron'),
                )),
          ]),
        ],
      ),
    );
  }
}
