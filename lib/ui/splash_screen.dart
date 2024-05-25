import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/ui/home_page.dart';
import 'package:client_dlaw/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/logo_splash.png', width: 400, height: 400),
      splashIconSize: 400,
      duration: 1500,
      nextScreen: const LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      // make gradient background color
      backgroundColor: backgroundColor1,
    );
  }
}
