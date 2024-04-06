import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paradox_2024/dio_service.dart';

import 'package:paradox_2024/features/home/model/question_model.dart';

class Question_Screen extends StatefulWidget {
  const Question_Screen({super.key});

  @override
  State<Question_Screen> createState() => _Question_ScreenState();
}

class _Question_ScreenState extends State<Question_Screen> {
  List<QuestionModel> questionList = [];
  int questionIndex = 3;
  bool isLastIndex = false;
  bool loading = false;
  TextEditingController answerController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> getQuestions() async {
    setState(() {
      loading = true;
    });
    try {
      print("-------------getting questions--------------------");
      Response response = await DioService().get('ques/form');
      print(response.data);
      List<dynamic> jsonList = response.data;
      print(jsonList);
      questionList = jsonList.map((e) => QuestionModel.fromJson(e)).toList();
      print(questionList);
      setState(() {
        loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> sumbitQuestions(QuestionModel question) async {
    setState(() {
      loading = true;
    });
    try {
      print("-------------submitting questions--------------------");
      var data = {
        "questionNo": "10",
        "question": question.question,
        "image": question.image,
        "answer": question.answer
      };
      var response = await DioService().post('ques/submit', data);
      print(response);

      setState(() {
        loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        loading = false;
        // questionIndex = 0;
        answerController.clear();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          (loading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
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
                                    const Text(
                                      'Q1: ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      questionList[questionIndex].question,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                    // height: height * 0.5,
                                    // width: width * 0.8,
                                    child: Image.asset(
                                  'assets/question_screen.png',
                                  fit: BoxFit.cover,
                                )),
                                Positioned(
                                  top: height * 0.055,
                                  left: width * 0.12,
                                  child: SizedBox(
                                    height: height * 0.31,
                                    width: width * 0.64,
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            questionList[questionIndex].image,
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.center),
                                            ),
                                          );
                                        },
                                        placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                        errorWidget: (context, url, error) {
                                          return Image.asset(
                                              "assets/paradox_logo.png");
                                        }),
                                  ),
                                ),
                              ],
                            ),
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
                                      if (value == null ||
                                          value.trim().isEmpty) {
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
                                    onPressed: () async {
                                      bool isCorrect = answerController.text
                                              .trim()
                                              .toLowerCase() ==
                                          questionList[questionIndex]
                                              .answer
                                              .trim()
                                              .toLowerCase();
                                      if (formKey.currentState!.validate()) {
                                        await sumbitQuestions(
                                            questionList[questionIndex]);

                                        // Optionally show feedback to the user
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(isCorrect
                                              ? 'Correct!'
                                              : 'Incorrect..'),
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
                                        side: BorderSide(
                                            width: 2, color: Colors.grey),
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
