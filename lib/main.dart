import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/model/models.dart';
import 'package:client_dlaw/provider/lawyer_provider.dart';
import 'package:client_dlaw/provider/search_lawyer_provider.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';
import 'package:client_dlaw/ui/auth/register_screen.dart';
import 'package:client_dlaw/ui/home_page.dart';
import 'package:client_dlaw/ui/lawyer_detail_page.dart';
import 'package:client_dlaw/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_dlaw/common/style.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => LawyersProvider(apiService: ApiServices())),
        ChangeNotifierProvider(
            create: (context) =>
                SearchLawyersProvider(apiService: ApiServices())),
      ],
      child: MaterialApp(
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
          LawyerDetailPage.routeName: (context) => LawyerDetailPage(
                lawyer:
                    ModalRoute.of(context)?.settings.arguments as LawyerUser,
              ),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
