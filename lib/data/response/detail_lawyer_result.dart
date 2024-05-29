part of 'responses.dart';

class DetailLawyerResult {
  bool error;
  String message;
  DetailLawyerResult lawyer;

  DetailLawyerResult({
    required this.error,
    required this.message,
    required this.lawyer,
  });

  factory DetailLawyerResult.fromJson(Map<String, dynamic> json) {
    return DetailLawyerResult(
      error: json['error'],
      message: json['message'],
      lawyer: DetailLawyerResult.fromJson(json['lawyer']),
    );
  }
}