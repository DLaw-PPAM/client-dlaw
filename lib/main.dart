import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/ui/home_page.dart';
import 'package:client_dlaw/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_dlaw/common/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D.Law',
      debugShowCheckedModeBanner: false,
      theme: primaryTheme,
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          child: Material(
            child: child,
          ),
        );
      },
      navigatorKey: navigatorKey,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
