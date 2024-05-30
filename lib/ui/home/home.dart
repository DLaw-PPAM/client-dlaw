import 'package:client_dlaw/ui/cases/upload_case.dart';
import 'package:client_dlaw/ui/notifications/notifications.dart';
import 'package:client_dlaw/ui/profile/profile.dart';
import 'package:client_dlaw/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:client_dlaw/ui/search_page.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override

  void onProfileButtonPressed() {
    Navigator.pushNamed(context, Profile.routeName);
  }

  void onNotificationButtonPressed() {
    Navigator.pushNamed(context, Notifications.routeName);
  }

  void onSearchButtonPressed() {
    Navigator.pushNamed(context, SearchPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
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
        body: ListView(children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                      child: Text(
                        "Welcome Back!",
                        style: TextStyle(fontSize: 30),
                      )),
                  Stack(children: <Widget>[
                    Image.asset(
                      "assets/images/back-home.png",
                      width: 800,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(40, 30, 20, 20),
                        child: Text(
                          "Try a free consultation",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(40, 60, 20, 20),
                        child: Text(
                          "Find a suitable service for your legal needs",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(40, 85, 20, 20),
                        child: SizedBox(
                            width: 100,
                            height: 45,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                child: FloatingActionButton(
                                  backgroundColor:
                                      const Color.fromARGB(255, 241, 223, 63),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  onPressed: () {
                                    onSearchButtonPressed();
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
                      padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: Text(
                        "Discover",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: SizedBox(
                          height: 215,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const <Widget>[
                              HomeCard(),
                              SizedBox(
                                width: 15,
                              ),
                              HomeCard(),
                              SizedBox(width: 15),
                              HomeCard()
                            ],
                          ))),
                  const Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: Text(
                        "Highest rated",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: SizedBox(
                          height: 215,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const <Widget>[
                              HomeCard(),
                              SizedBox(
                                width: 15,
                              ),
                              HomeCard(),
                              SizedBox(width: 15),
                              HomeCard()
                            ],
                          )))
                ],
              ))
        ]));
  }
}
