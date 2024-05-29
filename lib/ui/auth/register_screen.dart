import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';

import 'package:client_dlaw/ui/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenPage();
}

class _RegisterScreenPage extends State<RegisterScreen> {
  // @override
  String? username;
  String? password;

  void onFilterButtonPressed() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void onRegisterButtonPressed() {
    Navigator.pushNamed(context, HomePage.routeName);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Register',
        home: Scaffold(
            backgroundColor: backgroundColor1,
            body: Center(
              child: (Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                        width: 440,
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          margin: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: TextField(
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            decoration: const InputDecoration.collapsed(
                              hintText: "Username",
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF989898),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                username = value;
                              });
                            },
                          ),
                        )),
                    SizedBox(
                        width: 440,
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 50),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: TextField(
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            decoration: const InputDecoration.collapsed(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF989898),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          onFilterButtonPressed();
                        },
                        child: RichText(
                          text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(text: "Have an account? "),
                                TextSpan(
                                    text: "Login",
                                    style: TextStyle(color: Colors.yellow))
                              ]),
                        )),
                    SizedBox(
                        width: 440,
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            child: FloatingActionButton(
                              backgroundColor: Colors.yellow,
                              onPressed: () {
                                onRegisterButtonPressed();
                              },
                              child: Text("Login"),
                            )))
                  ])),
            )));
  }
}
