import 'package:flutter/material.dart';

import 'package:paradox_2024/features/home/model/question_model.dart';

class Question_Screen extends StatefulWidget {
  const Question_Screen({super.key});

  @override
  State<Question_Screen> createState() => _Question_ScreenState();
}

class _Question_ScreenState extends State<Question_Screen> {
  List<Question> questionList = [
    Question(prompt: "What is the capital of France?", answer: "Paris"),
    Question(
        prompt: "Who wrote 'Romeo and Juliet'?", answer: "William Shakespeare"),
    // Add more questions here
  ];
  int questionIndex = 0;
  bool isLastIndex = false;
  TextEditingController answerController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            //
            child: Image(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Stack(children: [
                          Image.asset('assets/question_bg.png'),
                          Row(
                            children: [
                              Text(
                                'Q1: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                questionList[questionIndex].prompt,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/question_screen.png'),
                      SizedBox(
                        height: height * 0.2,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text(
                                  'Hint :',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'The place Known for Coffee',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(
                                  30.0), // Adjust the radius as needed
                              border: Border.all(
                                color: Colors
                                    .white, // You can change the border color as needed
                                width: 2.0,
                              ),
                            ),
                            margin: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please type answer";
                                }
                                if (value.trim().toLowerCase() !=
                                    questionList[questionIndex]
                                        .answer
                                        .trim()
                                        .toLowerCase()) {
                                  return "Wrong answer";
                                }
                              },
                              controller: answerController,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintText: 'What do you think?',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 15),
                                border: InputBorder.none,

                                // border:
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                bool isCorrect = answerController.text
                                        .trim()
                                        .toLowerCase() ==
                                    questionList[questionIndex]
                                        .answer
                                        .trim()
                                        .toLowerCase();
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    questionIndex = (questionIndex + 1);
                                    answerController.clear();
                                  });

                                  // Optionally show feedback to the user
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        isCorrect ? 'Correct!' : 'Incorrect..'),
                                  ));
                                }
                              },
                              child: Text(
                                'SUMBIT',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Set the border radius to zero
                                ),
                                minimumSize: Size(double.infinity, 50),
                                backgroundColor:
                                    Color.fromRGBO(72, 108, 110, 1),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
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
