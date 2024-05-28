part of 'responses.dart';

class CasesResult {
  bool error;
  String message;
  List<Case> cases;

  CasesResult({
    required this.error,
    required this.message,
    required this.cases,
  });

  factory CasesResult.fromJson(Map<String, dynamic> json) {
    return CasesResult(
      error: json['error'],
      message: json['message'],
      cases: List<Case>.from(json['cases'].map((x) => Case.fromJson(x))),
    );
  }
}