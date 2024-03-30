import 'package:flutter/material.dart';

class rulesPage extends StatelessWidget {
  const rulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
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
          const SizedBox(height: 50,),
          const Padding(
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
                      fontSize: 45,
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
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff802C95),
                    ),
                  ),
                ),
                Text(
                  'RULES',
                  style: TextStyle(
                    fontFamily: 'Hermes',
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFDE34),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 400,
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
