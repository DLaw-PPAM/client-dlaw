import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/ui/profile/edit_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const String routeName = '/profile';

  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          actions: [
            IconButton(
                onPressed: () {
                  onEditButtonPressed();
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset("assets/images/lawy.png",
                        width: 160, height: 160, fit: BoxFit.cover),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Profile",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Text("Name",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(height: 3),
                        Text("Lil Cash",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Text("Birth Date",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(height: 3),
                        Text("13-07-2000",
                            style: TextStyle(
                              fontSize: 12,
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 12),
                const Text("Phone/Whatsapp",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 3),
                const Text("+62 0123 4567 8910",
                    style: TextStyle(
                      fontSize: 12,
                    )),
                const SizedBox(
                  height: 12,
                ),
                const Text("Address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 3),
                const Text("Jl. Street, Kecamatan District, Kota City, Country",
                    style: TextStyle(
                      fontSize: 12,
                    )),
                const SizedBox(
                  height: 12,
                ),
                const Text("Bio",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 3),
                const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(
                      fontSize: 12,
                    )),
                const SizedBox(height: 12),
                SizedBox(
                    width: 440,
                    height: 40,
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 50),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigation.back();
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Color(0xff587DBD)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text("Register as Lawyer",
                              style: TextStyle(color: Color(0xff587DBD))),
                        )))
              ],
            )));
  }
}
