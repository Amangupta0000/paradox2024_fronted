import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:paradox_2024/dio_service.dart';
import 'package:paradox_2024/local_data.dart';
import 'package:paradox_2024/utils/loading.dart';

class leaderboardPage extends StatefulWidget {
  const leaderboardPage({Key? key}) : super(key: key);

  @override
  State<leaderboardPage> createState() => _leaderboardPageState();
}

class _leaderboardPageState extends State<leaderboardPage> {
  List leaderboard = [];
  var loading = false;
  Future<void> getLeaderboard() async {
    try {
      setState(() {
        loading = true;
      });
      print("--------getting leaderboard--------");
      String? uid = await SharedData().getToken();
      print(uid);

      Response res = await DioService().post('leaderboard/lead', {"uid": uid});
      List jsonList = res.data["data"]['leaderboard'];
      print(jsonList);

      setState(() {
        leaderboard = jsonList;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeaderboard();
  }

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
            (loading)
                ? Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.28,
                      ),
                      DataLoader(),
                    ],
                  )
                : Padding(
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
                          top: screenHeight * 0.182,
                          left: screenWidth * 0.09,
                          child: Text(
                            leaderboard[1]['name'] ?? "unknown",
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.21,
                          left: screenWidth * 0.33,
                          child: Text(
                            leaderboard[0]['name'] ?? "Unknown",
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: screenHeight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.18,
                          left: screenWidth * 0.6,
                          child: Text(
                            leaderboard[2]['name'] ?? 'Unkonwn',
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: screenHeight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.265,
                          left: screenWidth * 0.05,
                          child: SizedBox(
                            height: screenHeight * 0.4,
                            width: screenWidth * 0.86,
                            child: ListView.builder(
                                itemCount: leaderboard.length,
                                itemBuilder: (ctx, idx) {
                                  if (idx + 2 < leaderboard.length)
                                    return Stack(
                                      children: [
                                        Container(
                                          height: screenHeight * 0.08,
                                          child: Image.asset(
                                            'assets/leaderboard_tile.png',
                                          ),
                                        ),
                                        Positioned(
                                          top: screenHeight * 0.026,
                                          left: screenWidth * 0.038,
                                          child: Row(
                                            children: [
                                              Text(
                                                (idx + 4).toString(),
                                                style: TextStyle(
                                                  // fontFamily: 'Hermes',
                                                  fontSize:
                                                      screenHeight * 0.013,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.16,
                                              ),
                                              Text(
                                                leaderboard[idx + 2]['name'] ??
                                                    'unknown',
                                                style: TextStyle(
                                                  fontFamily: 'Orbitron',
                                                  fontSize:
                                                      screenHeight * 0.015,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.05,
                                              ),
                                              Text(
                                                " Score : ${leaderboard[idx + 2]['score'].toString()}",
                                                style: TextStyle(
                                                  fontFamily: 'Orbitron',
                                                  fontSize:
                                                      screenHeight * 0.015,
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
