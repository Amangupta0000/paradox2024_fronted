import 'package:flutter/material.dart';
import 'package:paradox_2024/features/home/screens/level2/qr_screen.dart.dart';
import 'package:paradox_2024/utils/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Question_Screen_Level2 extends StatefulWidget {
  const Question_Screen_Level2({super.key});

  @override
  State<Question_Screen_Level2> createState() => _Question_Screen_Level2State();
}

class _Question_Screen_Level2State extends State<Question_Screen_Level2> {
  final formKey = GlobalKey<FormState>();
  TextEditingController answerController = TextEditingController();
  List<Map<String, dynamic>> questionList = [];
  int index = 0;
  void getCurrentIndex() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    index = await pref.getInt("index") ?? 0;
  }

  _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentIndex();
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Stack(children: [
                          Container(
                            height: height * 0.325,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/question_bg.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              // "Qu.$id : ${question!}",
                              "question.",
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
                      SizedBox(
                        height: height * 0.29,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                // Text(
                                //   ' Your Score : ',
                                //   style: TextStyle(
                                //     fontSize: height * 0.02,
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // Text(
                                //   score.toString() ?? "",
                                //   style: TextStyle(
                                //     fontSize: 18,
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // )
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
                              style: TextStyle(
                                fontSize: height * 0.009,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please type answer";
                                }
                                if (value.toLowerCase().trim() !=
                                    questionList[index]["answer"]) {
                                  return "Wrong anwser";
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
                                            canPop: false, child: DataLoader());
                                      });
                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  setState(() {
                                    index++;
                                    pref.setInt("index", index);
                                  });
                                  if (index == questionList.length) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (ctx) => QRScreen()));
                                  }
                                  Navigator.pop(context);
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
