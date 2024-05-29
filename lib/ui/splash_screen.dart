import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/logo_splash.png', width: 300, height: 300),
      splashIconSize: 300,
      duration: 1500,
      nextScreen: const LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      // make gradient background color
      backgroundColor: backgroundColor1,
    );
  }
}
