import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paradox_2024/dio_service.dart';
import 'package:paradox_2024/local_data.dart';

class leaderboardPage extends StatefulWidget {
  const leaderboardPage({Key? key}) : super(key: key);

  @override
  State<leaderboardPage> createState() => _leaderboardPageState();
}

class _leaderboardPageState extends State<leaderboardPage> {
  List leaderboard = [];
  var loading = false;
  Future<void> getLeaderboard() async {
    setState(() {
      loading = true;
    });
    print("--------getting leaderboard--------");
    String? name = await SharedData().getname();
    String? roll = await SharedData().getroll();

    String? uid = "${roll}${name}";
    print(uid);

    Response res = await DioService().post('leaderboard/lead', {});
    List jsonList = res.data["data"]['leaderboard'];
    print(jsonList);

    setState(() {
      leaderboard = jsonList;
      loading = false;
    });
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
                ? const Center(
                    child: CircularProgressIndicator(),
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
                          top: screenHeight * 0.18,
                          left: screenWidth * 0.08,
                          child: Text(
                            leaderboard[1]['name'] ?? "unknown",
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
                            leaderboard[0]['name'] ?? "Unknown",
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
                            leaderboard[2]['name'] ?? 'Unkonwn',
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
                                itemCount: leaderboard.length,
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
                                              leaderboard[idx]['name'] ??
                                                  'unknown',
                                              style: TextStyle(
                                                fontFamily: 'Hermes',
                                                fontSize: screenHeight * 0.022,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.1,
                                            ),
                                            Text(
                                              " Level : ${leaderboard[idx]['level'].toString()}",
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
