import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
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
                  textField(
                    controller: emailController,
                    labelText: "email",
                  ),
                  textField(
                      controller: passwordController, labelText: 'password'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            print('-------sign up user------');
                            Dio dio = Dio(BaseOptions(
                              responseType: ResponseType.json,
                              headers: {
                                'Content-Type': 'application/json',
                              },
                            ));
                            var data = {
                              'email': emailController.text.trim(),
                              'password': passwordController.text.trim()
                            };
                            Response response = await dio.post(
                                'http://10.0.2.2:3001 /api/v1/auth/signup',
                                data: data);
                            print(response.data);
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                            ));
                          }
                        }
                      },
                    
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                              8.0), // Set the border radius to zero
                        ),
                        minimumSize:const Size(double.infinity, 50),
                        backgroundColor: const Color.fromRGBO(72, 108, 110, 1),
                      ),
                        child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class textField extends StatelessWidget {
  const textField({
    super.key,
    required this.controller,
    required this.labelText,
  });
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius:
            BorderRadius.circular(30.0), // Adjust the radius as needed
        border: Border.all(
          color: Colors.white, // You can change the border color as needed
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
            return "This field cant be empty";
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          border: InputBorder.none,

          // border:
        ),
      ),
    );
  }
}
