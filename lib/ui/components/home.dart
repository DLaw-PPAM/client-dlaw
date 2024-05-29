import 'package:flutter/material.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';
import 'package:client_dlaw/ui/home_page.dart';
import 'package:flutter/cupertino.dart';

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
              icon: Icon(Icons.person_2_outlined)),
          IconButton(
            onPressed: () {
              onFilterButtonPressed();
            },
            icon: Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
    );
  }
}
