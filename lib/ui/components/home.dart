import 'package:flutter/material.dart';
import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';
import 'package:client_dlaw/ui/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  String? username;
  String? password;

  void onFilterButtonPressed() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void onRegisterButtonPressed() {
    Navigator.pushNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: [
            IconButton(
                onPressed: () {
                  onFilterButtonPressed();
                },
                icon: const Icon(Icons.person_2_outlined)),
            IconButton(
              onPressed: () {
                onFilterButtonPressed();
              },
              icon: const Icon(Icons.notifications_none_outlined),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 30),
                )),
            Stack(children: <Widget>[
              Image.asset(
                "images/back-home.png",
                width: 800,
                fit: BoxFit.cover,
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(40, 40, 20, 20),
                  child: Text(
                    "Try a free consultation",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              const Padding(
                  padding: EdgeInsets.fromLTRB(40, 70, 20, 20),
                  child: Text(
                    "Find a suitable service for your legal needs",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(40, 95, 20, 20),
                  child: SizedBox(
                      width: 100,
                      height: 45,
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: FloatingActionButton(
                            backgroundColor: Color.fromARGB(255, 241, 223, 63),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            onPressed: () {
                              onFilterButtonPressed();
                            },
                            child: const Text(
                              "Learn More",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ))))
            ]),
            const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Text(
                  "Discover",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ))
          ],
        ));
  }
}
