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

  void updateSelectedVav(int idx) {
    if (selectedIndex != idx) {
      setState(() {
        selectedIndex = idx;
      });
    }
  }

  List bottomNavBarItemAssetList = const [
    'assets/bottom_nav_bar_icons/home.png',
    'assets/bottom_nav_bar_icons/leaderboard.png',
    'assets/bottom_nav_bar_icons/rules.png',
    'assets/bottom_nav_bar_icons/prize.png',
    'assets/bottom_nav_bar_icons/profile.png',
  ];

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
    final width = MediaQuery.of(context).size.width;
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
        height: height * 0.1,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              bottomNavBarItemAssetList.length,
                  (index) {
                return GestureDetector(
                  onTap: () {
                    updateSelectedVav(index);
                  },
                  child: SizedBox(
                    height: height * 0.08,
                    child: Opacity(
                      opacity: selectedIndex == index ? 1 : 0.5,
                      child: Image.asset(bottomNavBarItemAssetList[index]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
