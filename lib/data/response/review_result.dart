part of 'responses.dart';

class ReviewsResult {
  bool error;
  String message;
  List<Review> reviews;

  ReviewsResult({
    required this.error,
    required this.message,
    required this.reviews,
  });

  factory ReviewsResult.fromJson(Map<String, dynamic> json) {
    return ReviewsResult(
      error: json['error'],
      message: json['message'],
      reviews:
          List<Review>.from(json['reviews'].map((x) => Review.fromJson(x))),
    );
  }
}
