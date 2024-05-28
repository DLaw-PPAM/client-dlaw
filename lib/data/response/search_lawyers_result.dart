part of 'responses.dart';

class SearchLawyersResult {
  bool error;
  int founded;
  List<LawyerUser> lawyers;

  SearchLawyersResult({
    required this.error,
    required this.founded,
    required this.lawyers,
  });

  factory SearchLawyersResult.fromJson(Map<String, dynamic> json) {
    return SearchLawyersResult(
      error: json['error'],
      founded: json['founded'],
      lawyers: List<LawyerUser>.from(
          json['lawyers'].map((x) => LawyerUser.fromJson(x))),
    );
  }
}