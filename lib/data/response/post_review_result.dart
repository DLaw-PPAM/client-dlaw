part of 'responses.dart';


class PostReviewsResult {
  bool error;
  String message;
  Review review;

  PostReviewsResult({
    required this.error,
    required this.message,
    required this.review,
  });

  factory PostReviewsResult.fromJson(Map<String, dynamic> json) {
    return PostReviewsResult(
      error: json['error'],
      message: json['message'],
      review: Review.fromJson(json['review']),
    );
  }
}
