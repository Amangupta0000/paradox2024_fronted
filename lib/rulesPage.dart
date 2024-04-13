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
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center( 
                    child: Text(
                      'Instructions:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '1. Eligibility: The game is open to all.',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '2. Level 1 Gameplay: Participants will have 19 hours, starting from 5 p.m. 12/04/2024 until 12 p.m. 13/04/2024 to complete level 1 and achieve the highest score possible. Participants will be awarded points for each successfully solved puzzle. The top 50 candidates with the highest scores will qualify for level 2.',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '3. Level 1 Scoring and Hints: Participants will get 10 points for every right answer however being the first solver of a question will give the participant 5 bonus points and being among the first 5 solvers will give 2 bonus points. There will be a deduction of 5 points for every hint accessed by the participant.',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 25.0),
                  Center(
                    child: Text(
                      'Terms and Conditions:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '1. Participants are responsible for their own safety while playing the game.',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '2. Participants are not allowed to use any external aids or consult any sources other than those provided by the organizers.',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 25.0),
                  // Add more rules as needed
                  Text(
                    'We hope you enjoy playing "Paradox" and wish you all the best for the game!',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
