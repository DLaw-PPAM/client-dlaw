import 'package:client_dlaw/ui/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/editprofile';

  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // @override
  String name = 'Lil Cash';
  DateTime date = DateTime.utc(2000, 11, 9);
  String phone = '082345678910';
  String address = "Jl. Street, Kecamatan District, Kota City, Country";
  String bio =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  late TextEditingController _nameController =
      TextEditingController(text: name);
  late TextEditingController _dateController =
      TextEditingController(text: date.toString());
  late TextEditingController _phoneController =
      TextEditingController(text: phone);
  late TextEditingController _addressController =
      TextEditingController(text: address);
  late TextEditingController _bioController = TextEditingController(text: bio);

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
                Row(
                  children: <Widget>[
                    Image.asset("images/lawy.png",
                        width: 160, height: 160, fit: BoxFit.cover),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 240,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: TextField(
                                controller: _nameController,
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                                decoration: null,
                                onChanged: (text) {
                                  setState(() {
                                    name = text;
                                  });
                                },
                              ),
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 240,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: TextField(
                                controller: _dateController,
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                                decoration: null,
                                onTap: () {
                                  _selectDate(context);
                                },
                              ),
                            )),
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
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: TextField(
                        controller: _phoneController,
                        textAlignVertical: TextAlignVertical.center,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        decoration: null,
                        onChanged: (text) {
                          setState(() {
                            phone = text;
                          });
                        },
                      ),
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
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: TextField(
                        controller: _addressController,
                        textAlignVertical: TextAlignVertical.center,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        decoration: null,
                        onChanged: (text) {
                          setState(() {
                            address = text;
                          });
                        },
                      ),
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
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: TextField(
                        maxLines: 10,
                        controller: _bioController,
                        textAlignVertical: TextAlignVertical.center,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        decoration: null,
                        onChanged: (text) {
                          setState(() {
                            bio = text;
                          });
                        },
                      ),
                    )),
                const SizedBox(height: 12),
                SizedBox(
                    width: 440,
                    height: 40,
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 50),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Save",
                              style: TextStyle(color: Color(0xff587DBD))),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.0, color: Color(0xff587DBD)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )))
              ],
            )));
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      date = newSelectedDate;
      _dateController
        ..text = DateFormat.yMMMd().format(date)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
