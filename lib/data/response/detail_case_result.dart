part of 'responses.dart';

class DetailCaseResult {
  bool error;
  String message;
  Case caseDetails;

  DetailCaseResult({
    required this.error,
    required this.message,
    required this.caseDetails,
  });

  factory DetailCaseResult.fromJson(Map<String, dynamic> json) {
    return DetailCaseResult(
      error: json['error'],
      message: json['message'],
      caseDetails: Case.fromJson(json['case']),
    );
  }
}