import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/dio_service.dart';
import 'package:paradox_2024/features/home/model/profile_model.dart';
import 'package:paradox_2024/local_data.dart';
import 'package:paradox_2024/utils/loading.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  late ProfileModel profiledata;
  var loading = false;
  String? userRank;
  Future<void> getprofile() async {
    setState(() {
      loading = true;
    });
    print("--------getting profile--------");

    String? uid = await SharedData().getToken();
    print(uid);

    Response res = await DioService().post('profile/display', {'uid': uid});
    Map<String, dynamic> json = res.data["data"];
    print(json);
    profiledata = ProfileModel.fromJson(json);
    setState(() {
      userRank = json["userPosition"].toString();
      loading = false;
    });

    print(profiledata);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprofile();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
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
                    fontSize: height * 0.07,
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
                    fontSize: height * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff802C95),
                  ),
                ),
              ),
              Text(
                'PARADOX',
                style: TextStyle(
                  fontFamily: 'Hermes',
                  fontSize: height * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFDE34),
                ),
              ),
            ],
          ),
        ),
        (loading)
            ? Column(
                children: [
                  SizedBox(
                    height: height * 0.33,
                  ),
                  DataLoader(),
                ],
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: height * 0.7,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/profile_bg.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                      top: height * 0.07,
                      left: width * 0.38,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile_image.png'),
                        backgroundColor: Colors.black,
                        radius: height * 0.06,
                      )),
                  Positioned(
                      top: height * 0.195,
                      // left: width * 0.3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.42),
                        child: Text(
                          profiledata.name,
                          // "KLaskshya xbdsk",
                          style: TextStyle(
                              fontSize: height * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Orbitron'),
                        ),
                      )),
                  Positioned(
                      top: height * 0.29,
                      left: width * 0.25,
                      child: Text(
                        '# $userRank  Leaderboard',
                        style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Orbitron'),
                      )),
                  Positioned(
                      top: height * 0.4,
                      left: width * 0.29,
                      child: Column(
                        children: [
                          Text(
                            profiledata.level.toString(),
                            style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Orbitron'),
                          ),
                          Text(
                            'Level',
                            style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Orbitron'),
                          ),
                        ],
                      )),
                  Positioned(
                      top: height * 0.4,
                      left: width * 0.68,
                      child: Column(
                        children: [
                          Text(
                            profiledata.score.toString(),
                            style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Orbitron'),
                          ),
                          Text(
                            'Score',
                            style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Orbitron'),
                          ),
                        ],
                      )),
                  Positioned(
                      top: height * 0.527,
                      left: width * 0.28,
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Orbitron'),
                          ),
                          Text(
                            'Coins',
                            style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Orbitron'),
                          ),
                        ],
                      )),
                  Positioned(
                      top: height * 0.53,
                      left: width * 0.641,
                      child: Column(
                        children: [
                          Text(
                            profiledata.attempts.toString(),
                            style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Orbitron'),
                          ),
                          Text(
                            'Attempt',
                            style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Orbitron'),
                          ),
                        ],
                      )),
                ],
              )
      ],
    );
  }
}
