import 'package:flutter/material.dart';
import 'package:paradox_2024/features/home/screens/home.dart';
import 'package:paradox_2024/leaderboardPage.dart';
import 'package:paradox_2024/prizePage.dart';
import 'package:paradox_2024/profilePage.dart';
import 'package:paradox_2024/rulesPage.dart';

class BottomNavBAR extends StatefulWidget {
  const BottomNavBAR({Key? key}) : super(key: key);

  @override
  State<BottomNavBAR> createState() => _BottomNavBARState();
}

class _BottomNavBARState extends State<BottomNavBAR> {
  int selectedIndex = 0;

  void updateSelectedNav(int idx) {
    if (selectedIndex != idx) {
      setState(() {
        selectedIndex = idx;
      });
    }
  }

  List<Widget> pages = [
    HomeScreen(),
    leaderboardPage(),
    rulesPage(),
    prizePage(),
    profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: pages[selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: height * 0.08,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int index = 0; index < pages.length; index++)
              GestureDetector(
                onTap: () {
                  updateSelectedNav(index);
                },
                child: SizedBox(
                  height: height * 0.07,
                  child: Opacity(
                    opacity: selectedIndex == index ? 1 : 0.5,
                    child: Icon(
                      _getIconData(index),
                      size: height * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.home_rounded;
      case 1:
        return Icons.leaderboard_rounded;
      case 2:
        return Icons.rule_sharp;
      case 3:
        return Icons.emoji_events_rounded;
      case 4:
        return Icons.person_rounded;
      default:
        return Icons.home;
    }
  }
}
