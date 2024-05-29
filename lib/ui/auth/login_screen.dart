import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/ui/auth/register_screen.dart';
import 'package:client_dlaw/ui/home_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenPage();
}

class _LoginScreenPage extends State<LoginScreen> {
  // @override
  String? username;
  String? password;

  void onFilterButtonPressed() {
    Navigator.pushNamed(context, HomePage.routeName);
  }

  void onRegisterButtonPressed() {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
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
                    TextButton(
                        onPressed: () {
                          onRegisterButtonPressed();
                        },
                        child: RichText(
                          text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(text: "Dont have an account? "),
                                TextSpan(
                                    text: "Register",
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
                                onFilterButtonPressed();
                              },
                              child: const Text("Login"),
                            )))
                  ])),
            )));
  }
}
