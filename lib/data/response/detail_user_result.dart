part of 'responses.dart';

class DetailUserResult {
  bool error;
  String message;
  User user;

  DetailUserResult({
    required this.error,
    required this.message,
    required this.user,
  });

  factory DetailUserResult.fromJson(Map<String, dynamic> json) {
    return DetailUserResult(
      error: json['error'],
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }
}