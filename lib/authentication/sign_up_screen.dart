import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        const Positioned.fill(
          //
          child: Image(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the radius as needed
                      border: Border.all(
                        color: Colors
                            .white, // You can change the border color as needed
                        width: 2.0,
                      ),
                    ),
                    margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please type answer";
                        }
                      },
                      // controller: answerController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        labelText: 'email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        border: InputBorder.none,

                        // border:
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
