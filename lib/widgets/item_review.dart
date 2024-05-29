import 'package:client_dlaw/data/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemReview extends StatelessWidget {
  final Review review;

  const ItemReview({
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.clientName,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              DateFormat('dd/MM/yyyy').format(review.timestamp),
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 12.0),
            Text(
              review.description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
