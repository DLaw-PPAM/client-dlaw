import 'package:client_dlaw/ui/notifications/notification_each.dart';
import 'package:client_dlaw/ui/profile/edit_profile.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  static const String routeName = '/notifications';

  const Notifications({super.key});
  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  // @override

  void onEditButtonPressed() {
    Navigator.pushNamed(context, EditProfile.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Notifications",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                NotificationEach(),
                Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width - 44,
                  height: 0.2,
                ),
                NotificationEach(),
                Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width - 44,
                  height: 0.2,
                ),
              ],
            )));
  }
}
