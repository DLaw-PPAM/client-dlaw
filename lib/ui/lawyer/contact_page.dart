import 'package:client_dlaw/common/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  static const routeName = '/contact';

  final String phoneNumber;

  const ContactPage({super.key, required this.phoneNumber});

  String initializePhoneIndo(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      return '62${phoneNumber.substring(1)}';
    } else if (phoneNumber.startsWith('62')) {
      return phoneNumber;
    } else {
      return '62$phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    final phoneIndo = initializePhoneIndo(phoneNumber);

    final Uri whatsappUrl = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phoneIndo,
    );
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.whatsapp,
              size: 150,
              color: Color(0xFF50BC59),
            ),
            const SizedBox(height: 30),
            const Text(
              'You will be redirected to Whatsapp',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () async {
                launchUrl(whatsappUrl);
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF50BC59),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                ('+$phoneIndo'),
                style: const TextStyle(
                  fontSize: 13,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 15,
        left: 15,
        child: SafeArea(
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
