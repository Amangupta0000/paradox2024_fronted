import 'package:flutter/material.dart';

class leaderboardPage extends StatefulWidget {
  const leaderboardPage({super.key});

  @override
  State<leaderboardPage> createState() => _leaderboardPageState();
}

class _leaderboardPageState extends State<leaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is the Leaderboard Page'),
      ),
    );
  }
}
