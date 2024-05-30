import 'package:client_dlaw/ui/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class UploadCase extends StatefulWidget {
  static const String routeName = '/uploadcase';

  const UploadCase({super.key});
  @override
  State<UploadCase> createState() => _UploadCaseState();
}

class _UploadCaseState extends State<UploadCase> {
  // @override
  String? name;
  String? type;
  String? description;
  String? images;

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Upload a Case",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Case Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(height: 3),
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
                    Text("Case Type",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(height: 3),
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
                            textAlignVertical: TextAlignVertical.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                            decoration: null,
                            onChanged: (text) {
                              setState(() {
                                type = text;
                              });
                            },
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 12),
                const Text("Description",
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
                        textAlignVertical: TextAlignVertical.center,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        decoration: null,
                        onChanged: (text) {
                          setState(() {
                            description = text;
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
                    )),
              ],
            )));
  }
}
