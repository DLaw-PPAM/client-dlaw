import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/ui/home_page.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenPage();
}

class _RegisterScreenPage extends State<RegisterScreen> {
  String? username;
  String? password;
  bool _obscureText = true;

  void onFilterButtonPressed() {
    Navigation.back();
  }

  void onRegisterButtonPressed() {
    Navigator.pushNamed(context, HomePage.routeName);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(
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
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
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
              ),
            ),
            SizedBox(
              width: 440,
              height: 80,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                margin: const EdgeInsets.fromLTRB(50, 16, 50, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        obscureText: _obscureText,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
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
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),  // Remove padding
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                    const SizedBox(width: 10),  // Add some space between the icon and edge
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                onFilterButtonPressed();
              },
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(text: "Have an account? "),
                    TextSpan(
                      text: "Login",
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 440,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: FloatingActionButton(
                  backgroundColor: Colors.yellow,
                  onPressed: () {
                    onRegisterButtonPressed();
                  },
                  child: const Text("Register"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
