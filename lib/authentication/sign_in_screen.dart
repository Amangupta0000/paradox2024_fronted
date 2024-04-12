import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paradox_2024/authentication/sign_up_screen.dart';
import 'package:paradox_2024/bottomNavBar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.3,
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
                                      fontSize: height * 0.05,
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
                                      fontSize: height * 0.05,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff802C95),
                                    ),
                                  ),
                                ),
                                Text(
                                  'PARADOX',
                                  style: TextStyle(
                                    fontFamily: 'Hermes',
                                    fontSize: height * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFDE34),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          textField(
                            controller: emailController,
                            labelText: "email",
                          ),
                          textField(
                            controller: passwordController,
                            labelText: 'password',
                          ),
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
                                    },
                                  );
                                  try {
                                    print('-------sign in user------');
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
                                      'https://paradox-1.onrender.com/api/v1/auth/login',
                                      data: data,
                                    );

                                    print(response);
                                    var token = response.data['token'];

                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    pref.setString('token', token);

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomNavBAR(),
                                      ),
                                      (route) => false,
                                    );
                                  } catch (e) {
                                    print(e);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(e.toString()),
                                    ));
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor:
                                    const Color.fromRGBO(72, 108, 110, 1),
                              ),
                              child: const Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.11,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Create new account:',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const SignUpScreen(),
                                ));
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class textField extends StatelessWidget {
  const textField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color: Colors.white,
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
          hintStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          labelText: labelText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
