import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/authentication/sign_up_screen.dart';
import 'package:paradox_2024/bottomNavBar.dart';
import 'package:paradox_2024/firebase_options.dart';
import 'package:paradox_2024/profilePage.dart';
import 'package:paradox_2024/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paradox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SplashScreen(),

      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const CircularProgressIndicator();
      //     }
      //     if (snapshot.hasData) {
      //       return const HomeScreen();
      //     } else {
      //       return const SignIn();
      //     }
      //   },
      // ),
    );
  }
}
