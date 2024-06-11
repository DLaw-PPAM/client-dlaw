import 'package:client_dlaw/common/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
        body: ListView(children: <Widget>[
          Padding(
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
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
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
                  const Text("Supporting Medias",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(height: 3),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                          onTap: () {
                            pickImageC();
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: image != null
                                ? Image.file(image!)
                                : Text("Upload Image"),
                          ))),
                  SizedBox(height: 20),
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
                            child: const Text("Save",
                                style: TextStyle(color: Color(0xff587DBD))),
                          )))
                ],
              ))
        ]));
  }
}
