import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/dio_service.dart';
import 'package:paradox_2024/features/home/screens/level1_complete_screen.dart';
import 'package:paradox_2024/local_data.dart';
import 'package:paradox_2024/utils/loading.dart';

class Question_Screen extends StatefulWidget {
  const Question_Screen({super.key});

  @override
  State<Question_Screen> createState() => _Question_ScreenState();
}

class _Question_ScreenState extends State<Question_Screen> {
  bool loading = false;

  String? question;
  String? image;
  String? hint;
  int? id;
  bool isHintUse = false;
  bool isHintAvailable = false;
  var score;
  TextEditingController answerController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> getQuestions() async {
    setState(() {
      loading = true;
    });
    try {
      print("-------------getting questions--------------------");
      String? name = await SharedData().getname();
      String? roll = await SharedData().getroll();

      String? uid = "${roll}${name}";
      Response response = await DioService().post('level1/ques', {"uid": uid});

      var res = response.data;

      if (res["message"] == "Level Finished") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => LevelCompleteScreen()));
      }
      // List<dynamic> jsonList = response.data;
      else {
        print(response.data["data"]["nextQuestion"]["question"]);

        // questionList = jsonList.map((e) => QuestionModel.fromJson(e)).toList();

        setState(() {
          if (response.data["data"]["nextQuestion"]["hint"] != null) {
            print("isHintAvailable");

            isHintAvailable = true;
            hint = response.data["data"]["nextQuestion"]["hint"];
            isHintUse = true;
          }
          question = response.data["data"]["nextQuestion"]["question"];
          image = response.data["data"]["nextQuestion"]["image"];
          print(image);
          id = response.data["data"]["nextQuestion"]["questionNo"];
          score = response.data["data"]["nextQuestion"]["score"];
          loading = false;
        });
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Some error occured  '),
      ));
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> getHints() async {
    try {
      print("-------------getting hints--------------------");
      String? name = await SharedData().getname();
      String? roll = await SharedData().getroll();

      String? uid = "${roll}${name}";
      print(id);
      Response response = await DioService()
          .post('level1/hint', {"id": id.toString(), "uid": uid});

      var res = response.data["data"];
      if (response.data['message'] ==
          "Not enough points available to unlock the hint") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Not enough points available to unlock the hint'),
        ));
      } else {
        setState(() {
          hint = res["nextQuestion"]["hint"];
          score = response.data["data"]["nextQuestion"]["score"];

          isHintUse = true;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Some error occured  '),
      ));
      print(e);
    }
  }

  Future<void> sumbitQuestions(String answer) async {
    try {
      print("-------------submitting questions--------------------");
      String? name = await SharedData().getname();
      String? roll = await SharedData().getroll();

      String? uid = "${roll}${name}";
      var data = {"answer": answer, "uid": uid};
      var response = await DioService().post('level1/answer', data);
      var res = response.data;
      print(response.data);
      if (res["message"] == "Level Finished") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => LevelCompleteScreen()));
      } else if (res["message"] == "Answer is not correct") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Oops Incorrect!...Try again'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Well done...Correct answer!!'),
        ));
        setState(() {
          if (response.data["data"]["nextQuestion"]["hint"] != null) {
            print("isHintAvailable");

            isHintAvailable = true;
            hint = response.data["data"]["nextQuestion"]["hint"];
            isHintUse = true;
          }
          question = response.data["data"]["nextQuestion"]["question"];
          image = response.data["data"]["nextQuestion"]["image"];
          id = response.data["data"]["nextQuestion"]["questionNo"];
          score = response.data["data"]["nextQuestion"]["score"];
          answerController.clear();

          isHintUse = false;
          isHintAvailable = false;
        });
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Some error occured  '),
      ));
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
          (loading && question == null)
              ? DataLoader()
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(height: height*0.01,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Stack(children: [
                                Container(
                                  height: height * 0.09,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/question_bg.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Qu.$id : ${question!}",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: height * 0.022,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
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
                                  left: width * 0.11,
                                  child: SizedBox(
                                    height: height * 0.28,
                                    width: width * 0.65,
                                    child: CachedNetworkImage(
                                        imageUrl: image!,
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.contain,
                                                  alignment: Alignment.center),
                                            ),
                                          );
                                        },
                                        placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                        errorWidget: (context, url, error) {
                                          return Text(
                                              " Some error is occured on getting the image ! Check your internet connection..");
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        ' Your Score : ',
                                        style: TextStyle(
                                          fontSize: height * 0.02,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        score.toString() ?? "",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
                                      (isHintUse)
                                          ? Text(
                                              hint ?? "",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  showDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      builder: (context) {
                                                        return PopScope(
                                                            canPop: false,
                                                            child:
                                                                DataLoader());
                                                      });
                                                  await getHints();
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Get Hint",
                                                  style: TextStyle(
                                                    fontSize: height * 0.02,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 2,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0), // Set the border radius to zero
                                                  ),
                                                  minimumSize: Size(
                                                      width * 0.01,
                                                      height * 0.04),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          72, 108, 110, 1),
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
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
                                    },
                                    controller: answerController,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'What do you think?',
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
                                      if (formKey.currentState!.validate()) {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return PopScope(
                                                  canPop: false,
                                                  child: DataLoader());
                                            });
                                        await sumbitQuestions(
                                            answerController.text.trim());
                                        Navigator.of(context).pop();
                                        // Optionally show feedback to the user
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
