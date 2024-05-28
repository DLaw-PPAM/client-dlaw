part of 'responses.dart';

class LawyersResult {
  bool error;
  String message;
  List<LawyerUser> lawyers;

  LawyersResult({
    required this.error,
    required this.message,
    required this.lawyers,
  });

  factory LawyersResult.fromJson(Map<String, dynamic> json) {
    return LawyersResult(
      error: json['error'],
      message: json['message'],
      lawyers: List<LawyerUser>.from(json['lawyers'].map((x) => LawyerUser.fromJson(x))),
    );
  }
}