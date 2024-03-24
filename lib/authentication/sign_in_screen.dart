import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';



class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    void signInWithGoogle() {
      try {
        GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

        auth.signInWithProvider(googleAuthProvider);
      } on Exception catch (e) {
        debugPrint('exception->$e');
      }
    }

    return Stack(children: <Widget>[
      const Positioned.fill(
        //
        child: Image(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
        top: 395,
        left: 40,
        child: SizedBox(
          height: 45,
          width: 321,
          child: SignInButton(
            // icon: Icon(),
            Buttons.google,
            text: "GOOGLE",
            padding: const EdgeInsets.symmetric(horizontal: 100),
            onPressed: signInWithGoogle,
            shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
            // backgroundColor: Colors.black,
          ),
        ),
      ),
    ]);
  }
}
// Scaffold(
//         appBar: AppBar(title: Text("Paradox")),
//         body: Center(
//           child: SizedBox(
//             height: 40,
//             child: SignInButton(
//               Buttons.google,
//               onPressed: signInWithGoogle,
//               shape: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//         ));