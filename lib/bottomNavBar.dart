import 'package:flutter/material.dart';
import 'package:paradox_2024/features/home/screens/home.dart';

class BottomNavBAR extends StatefulWidget {
  const BottomNavBAR({super.key});

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
    'assets/bootom_nav_bar_icons/home.png',
    'assets/bootom_nav_bar_icons/leaderboard.png',
    'assets/bootom_nav_bar_icons/rules.png',
    'assets/bootom_nav_bar_icons/prize.png',
    'assets/bootom_nav_bar_icons/profile.png',
  ];
  List body = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: const Stack(
        children: [
          Positioned.fill(
            //
            child: Image(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
               HomeScreen(),
              ],
            ),
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
                        child: Image.asset(bottomNavBarItemAssetList[index])),
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
