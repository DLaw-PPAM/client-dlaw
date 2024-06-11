import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/model/models.dart';
import 'package:client_dlaw/provider/case_provider.dart';
import 'package:client_dlaw/provider/lawyers_provider.dart';
import 'package:client_dlaw/provider/search_lawyer_provider.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';
import 'package:client_dlaw/ui/auth/register_screen.dart';
import 'package:client_dlaw/ui/case/case_detail_page.dart';
import 'package:client_dlaw/ui/case_page.dart';
import 'package:client_dlaw/ui/lawyer/contact_page.dart';
import 'package:client_dlaw/ui/profile/profile.dart';
import 'package:client_dlaw/ui/home_page.dart';
import 'package:client_dlaw/ui/lawyer/lawyer_detail_page.dart';
import 'package:client_dlaw/ui/cases/upload_case.dart';
import 'package:client_dlaw/ui/notifications/notifications.dart';
import 'package:client_dlaw/ui/profile/edit_profile.dart';
import 'package:client_dlaw/ui/search_page.dart';
import 'package:client_dlaw/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_dlaw/common/style.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => LawyersProvider(apiService: ApiServices())),
        ChangeNotifierProvider(
            create: (context) =>
                SearchLawyersProvider(apiService: ApiServices())),
        ChangeNotifierProvider(
            create: (context) => CasesProvider(
                apiService: ApiServices(),
                id: '0eb320ff-1b01-44cb-be87-6bc686bc2623')),
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
          CasePage.routeName: (context) => const CasePage(),
          CaseDetailPage.routeName: (context) => CaseDetailPage(
                kasus: ModalRoute.of(context)?.settings.arguments as Case,
              ),
          LawyerDetailPage.routeName: (context) => LawyerDetailPage(
                lawyer:
                    ModalRoute.of(context)?.settings.arguments as LawyerUser,
              ),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          Profile.routeName: (context) => const Profile(),
          ContactPage.routeName: (context) => ContactPage(
                phoneNumber:
                    ModalRoute.of(context)?.settings.arguments as String,
              ),
          SearchPage.routeName: (context) => const SearchPage(),
          EditProfile.routeName: (context) => const EditProfile(),
          Notifications.routeName: (context) => const Notifications(),
          UploadCase.routeName: (context) => const UploadCase(),
        },
      ),
    );
  }
}
