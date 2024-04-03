import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/authentication/sign_up_screen.dart';
import 'package:paradox_2024/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return PopScope(
                                  canPop: false,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              });
                          try {
                            print('-------sign in user------');

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
                            var response = await http.post(
                                Uri.parse(
                                    'https://paradox-1.onrender.com/api/v1/auth/login'),
                                body: data);

                            print(response);
                            // var token = response.data['token'];
                            // SharedPreferences pref =
                            //     await SharedPreferences.getInstance();
                            // pref.setString('token', token);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomNavBAR()),
                                (route) => false);

                          
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                            ));
                            Navigator.pop(context);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                              8.0), // Set the border radius to zero
                        ),
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color.fromRGBO(72, 108, 110, 1),
                      ),
                      child: const Text(
                        'SIGN In',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create new account',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ],
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
