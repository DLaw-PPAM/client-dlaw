import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/ui/login_screen.dart';
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
                      "Log In",
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
                    SizedBox(
                        width: 440,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(50, 0, 50, 16),
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
                              hintText: "Confirm Password",
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
                    SizedBox(
                        width: 350,
                        height: 60,
                        child: SizedBox(
                            child: FloatingActionButton(
                          backgroundColor: const Color(0xFFC67C4E),
                          onPressed: () {
                            onFilterButtonPressed();
                          },
                          child: Text("Register"),
                        )))
                  ])),
            )));
  }
}
