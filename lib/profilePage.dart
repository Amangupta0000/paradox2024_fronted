import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/dio_service.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  Future<void> getprofile() async {
    print("----------------getting profile-----");
    Response res =
        await DioService().post('profile/display', {'uid': "22bcs012"});
    print(res.data);
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
        Text(
          'PARADOX',
          style: TextStyle(
            fontFamily: 'Hermes',
            fontSize: height * 0.06,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFDE34),
          ),
        ),
        Stack(
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
                top: height * 0.119,
                left: width * 0.4,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 40,
                )),
            Positioned(
                top: height * 0.219,
                left: width * 0.4,
                child: Text('Aman Gupta')),
            Positioned(
                top: height * 0.29,
                left: width * 0.25,
                child: Text(
                  '#2                Leaderboard',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Orbitron'),
                )),
            Positioned(
                top: height * 0.4,
                left: width * 0.3,
                child: Column(
                  children: [
                    Text(
                      '2',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Orbitron'),
                    ),
                    Text(
                      'Level',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Orbitron'),
                    ),
                  ],
                )),
            Positioned(
                top: height * 0.41,
                left: width * 0.7,
                child: Column(
                  children: [
                    Text(
                      '2',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Orbitron'),
                    ),
                    Text(
                      'Score',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Orbitron'),
                    ),
                  ],
                )),
            Positioned(
                top: height * 0.52,
                left: width * 0.3,
                child: Column(
                  children: [
                    Text(
                      '2',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Orbitron'),
                    ),
                    Text(
                      'Coins',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Orbitron'),
                    ),
                  ],
                )),
            Positioned(
                top: height * 0.54,
                left: width * 0.68,
                child: Column(
                  children: [
                    Text(
                      '2',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Orbitron'),
                    ),
                    Text(
                      'Attempt',
                      style: TextStyle(
                          fontSize: 17,
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
