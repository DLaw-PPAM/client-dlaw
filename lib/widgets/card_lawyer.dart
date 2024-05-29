import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/data/model/models.dart';
import 'package:client_dlaw/ui/lawyer_detail_page.dart';
import 'package:flutter/material.dart';

class CardLawyer extends StatelessWidget {
  final LawyerUser lawyer;

  const CardLawyer({super.key, required this.lawyer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.intentWithData(LawyerDetailPage.routeName, lawyer);
      },
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: SizedBox(
                    width: 125,
                    height: 100,
                    child: Image.network(
                      lawyer.user.profilePicture ?? '',
                      fit: BoxFit.cover,
                      loadingBuilder: (_, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: grey,
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) {
                        return const Icon(
                          Icons.broken_image,
                          color: grey,
                          size: 100,
                        );
                      },
                    )),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lawyer.user.fullname,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.work,
                          color: grey,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          lawyer.specialities?.first.name ?? '',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color(0xFF616161),
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: grey,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            lawyer.user.address ?? '',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: const Color(0xFF616161),
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          lawyer.rating.toStringAsFixed(1),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color(0xFF616161),
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
