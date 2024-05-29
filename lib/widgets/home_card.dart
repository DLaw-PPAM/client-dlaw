import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      "assets/images/lawy.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      "Peng Accara",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    )),
                const Text(
                  "Divorce, Corporate Lawyer",
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Bandung",
                        style:
                            TextStyle(color: Color(0xff777777), fontSize: 12)),
                    Row(
                      children: [
                        Text(
                          "4.9",
                          style:
                              TextStyle(color: Color(0xff777777), fontSize: 12),
                        ),
                        Icon(Icons.star, color: Colors.yellow, size: 12)
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
