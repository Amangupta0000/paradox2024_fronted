import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paradox_2024/authentication/sign_up_screen.dart';
import 'package:paradox_2024/bottomNavBar.dart';
import 'package:paradox_2024/features/home/screens/home.dart';
import 'package:paradox_2024/local_data.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      _checkTokenAndNavigate();
    });
  }

  void _checkTokenAndNavigate() async {
    String? token = await SharedData().getToken();
    print(token);
    if (token != null) {
      // Token is valid, navigate to HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomNavBAR()),
      );
    } else {
      // Token is invalid or not available, navigate to LoginScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: [
        const Positioned.fill(
          child: Image(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: Image.asset('assets/paradox_logo.png'),
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'PARADOX',
                  style: TextStyle(
                    fontFamily: 'Hermes',
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFDE34),
                  ),
                ),
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
