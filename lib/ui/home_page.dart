import 'package:client_dlaw/ui/case_page.dart';
import 'package:client_dlaw/ui/notifications/notifications.dart';
import 'package:client_dlaw/ui/profile/profile.dart';
import 'package:client_dlaw/ui/search_page.dart';
import 'package:client_dlaw/ui/home/home.dart';
import 'package:client_dlaw/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.cases_outlined),
      label: 'Case',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  final List<Widget> _listWidget = [
    const Home(),
    const SearchPage(),
    const CasePage(),
  ];

  void onProfileButtonPressed() {
    Navigator.pushNamed(context, Profile.routeName);
  }

  void onNotificationButtonPressed() {
    Navigator.pushNamed(context, Notifications.routeName);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                onProfileButtonPressed();
              },
              icon: const Icon(Icons.person_2_outlined)),
          IconButton(
            onPressed: () {
              onNotificationButtonPressed();
            },
            icon: const Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Theme.of(context).primaryColor,
        items: _bottomNavBarItems,
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: false,
            border: const Border(bottom: BorderSide(color: Colors.transparent)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: Row(
              children: [
                CupertinoNavigationBarBackButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  SearchPage.searchTitle,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          child: _listWidget[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
