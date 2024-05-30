import 'package:flutter/material.dart';

class NotificationEach extends StatelessWidget {
  const NotificationEach({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width - 84,
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Text(
                          "You have update status on one of your cases",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ))),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: const Icon(Icons.chevron_right_rounded,
                        color: Colors.black)),
              ],
            )));
  }
}
