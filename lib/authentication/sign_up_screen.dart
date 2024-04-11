import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/authentication/sign_in_screen.dart';
import 'package:paradox_2024/bottomNavBar.dart';
import 'package:paradox_2024/dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final rollNoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    rollNoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.04),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.3,
                      child: Image.asset('assets/paradox_logo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 2,
                            child: Text(
                              'PARADOX',
                              style: TextStyle(
                                fontFamily: 'Hermes',
                                fontSize: screenSize.height * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff802C95),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 2,
                            left: 0,
                            child: Text(
                              'PARADOX',
                              style: TextStyle(
                                fontFamily: 'Hermes',
                                fontSize: screenSize.height * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff802C95),
                              ),
                            ),
                          ),
                          Text(
                            'PARADOX',
                            style: TextStyle(
                              fontFamily: 'Hermes',
                              fontSize: screenSize.height * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFDE34),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    TextField(
                      controller: usernameController,
                      labelText: "username",
                    ),
                    TextField(
                      controller: rollNoController,
                      labelText: "roll number",
                    ),
                    TextField(
                      controller: emailController,
                      labelText: "email",
                    ),
                    TextField(
                      controller: passwordController,
                      labelText: 'password',
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.1,
                          vertical: screenSize.height * 0.01),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return const PopScope(
                                  canPop: false,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            );
                            try {
                              Dio dio = Dio(
                                BaseOptions(
                                  responseType: ResponseType.json,
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                ),
                              );
                              var data = {
                                'email': emailController.text.trim(),
                                'password': passwordController.text.trim()
                              };
                              Response response = await dio.post(
                                'https://paradox-1.onrender.com/api/v1/auth/signup',
                                data: data,
                              );
                              var token = response.data['token'];
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.setString('token', token);
                              pref.setString(
                                  'name', usernameController.text.trim());
                              pref.setString(
                                  'roll', rollNoController.text.trim());
                              var res = await createUser(
                                emailController.text.trim(),
                                usernameController.text.trim(),
                                rollNoController.text.trim(),
                              );
                              if (res == "Success") {
                                var token = response.data['token'];
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.setString('token', token);
                                pref.setString(
                                    'name', usernameController.text.trim());
                                pref.setString(
                                    'roll', rollNoController.text.trim());
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BottomNavBAR(),
                                  ),
                                  (route) => false,
                                );
                              } else {
                                Navigator.pop(context);
                              }
                            } catch (e) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: screenSize.width * 0.005,
                                color: Colors.grey),
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.02),
                          ),
                          minimumSize:
                              Size(double.infinity, screenSize.height * 0.06),
                          backgroundColor:
                              const Color.fromRGBO(72, 108, 110, 1),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const SignInScreen(),
                            ));
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> createUser(String email, String name, String roll) async {
  try {
    var uid = roll + name;
    var data = {
      'uid': uid,
      "name": name,
      'email': email,
      'roll': roll,
      'refCode': null,
      'teamCode': null,
      'teamName': null,
      'displayPicture': null
    };
    Response res = await DioService().post('auth/createUser', data);
    return 'Success';
  } catch (e) {
    return 'error';
  }
}

class TextField extends StatelessWidget {
  const TextField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(screenSize.width * 0.08),
        border: Border.all(
          color: Colors.white,
          width: screenSize.width * 0.005,
        ),
      ),
      margin: EdgeInsets.all(screenSize.width * 0.02),
      child: TextFormField(
        style: TextStyle(
          fontSize: screenSize.width * 0.05,
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
            fontSize: screenSize.width * 0.05,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(
              vertical: screenSize.width * 0.03,
              horizontal: screenSize.width * 0.04),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
