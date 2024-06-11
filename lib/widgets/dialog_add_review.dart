import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/provider/detail_lawyer_provider.dart';
import 'package:client_dlaw/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DialogAddReview extends StatefulWidget {
  final String id;

  const DialogAddReview({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<DialogAddReview> createState() => _DialogAddReviewState();
}

class _DialogAddReviewState extends State<DialogAddReview> {
  final nameController = TextEditingController();
  final ratingController = TextEditingController();
  final reviewController = TextEditingController();

  final String title = "Add Review";
  final String nameHint = 'Your name';
  final String ratingHint = 'Your rating (1-5)';
  final String reviewHint = 'Your review';

  Future<void> _onYesPressed(BuildContext context) async {
    if (nameController.text.isEmpty ||
        ratingController.text.isEmpty ||
        reviewController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Validation Error'),
            content: Text('All fields are required.'),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigation.back();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    final provider = Provider.of<DetailLawyerProvider>(context, listen: false);
    await provider.postReview(
      lawyerId: widget.id,
      userId: '0eb320ff-1b01-44cb-be87-6bc686bc2623',
      clientName: nameController.text,
      rating: int.parse(ratingController.text),
      description: reviewController.text,
    );

    Navigation.back();

    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Success'),
          content: Text('Review has been added.'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigation.back();
              },
            ),
          ],
        );
      },
    );
  }

  void _onNoPressed() {
    Navigation.back();
  }

  Widget _buildAndroid(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Wrap(
        runSpacing: 12.0,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: nameController,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: black,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: grey),
                ),
                hintText: nameHint,
                hintStyle: const TextStyle(color: grey),
              ),
              style: TextStyle(
                color: black,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: ratingController,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: black,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[1-5]')),
                LengthLimitingTextInputFormatter(1)
              ],
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: grey),
                ),
                hintText: ratingHint,
                hintStyle: const TextStyle(color: grey),
              ),
              style: TextStyle(
                color: black,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: reviewController,
              cursorColor: black,
              textAlignVertical: TextAlignVertical.top,
              maxLines: 4,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: grey),
                ),
                hintText: reviewHint,
                hintStyle: const TextStyle(color: grey),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'Yes',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: () {
            _onYesPressed(context);
          },
        ),
        TextButton(
          onPressed: _onNoPressed,
          child: Text(
            'No',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Column(
        children: [
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: nameController,
            placeholder: nameHint,
            textAlignVertical: TextAlignVertical.center,
            maxLines: 1,
            placeholderStyle: const TextStyle(color: grey),
          ),
          const SizedBox(height: 12),
          CupertinoTextField(
            controller: ratingController,
            placeholder: ratingHint,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[1-5]')),
              LengthLimitingTextInputFormatter(1)
            ],
            maxLines: 1,
            placeholderStyle: const TextStyle(color: grey),
          ),
          const SizedBox(height: 12),
          CupertinoTextField(
            controller: reviewController,
            placeholder: reviewHint,
            textAlignVertical: TextAlignVertical.top,
            maxLines: 4,
            placeholderStyle: const TextStyle(color: grey),
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text('Yes'),
          onPressed: () {
            _onYesPressed(context);
          },
        ),
        CupertinoDialogAction(
          child: const Text('No'),
          onPressed: _onNoPressed,
        ),
      ],
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ratingController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailLawyerProvider>(
      create: (context) =>
          DetailLawyerProvider(apiServices: ApiServices(), id: widget.id),
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }
}
