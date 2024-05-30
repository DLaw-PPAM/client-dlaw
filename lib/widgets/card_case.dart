import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/data/model/models.dart';
import 'package:client_dlaw/ui/case/case_detail_page.dart';
import 'package:flutter/material.dart';

class CardCase extends StatelessWidget {
  final Case cases;

  const CardCase({super.key, required this.cases});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigation.intentWithData(CaseDetailPage.routeName, cases)},
      child: Card(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          NetworkImage(cases.lawyer.user.profilePicture ?? ''),
                    ),
                    const SizedBox(width: 13),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cases.subject,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                          const SizedBox(height: 8),
                          Text(
                            cases.lawyer.user.fullname,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          )
                        ]),
                  ],
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.black,
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: [
                    const Text("Status: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                    Text(cases.status, style: const TextStyle(fontSize: 12)),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    const Text("Note: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                    Text(cases.notes, style: const TextStyle(fontSize: 12)),
                  ],
                )),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
