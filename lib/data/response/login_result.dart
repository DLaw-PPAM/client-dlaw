import 'package:client_dlaw/data/model/login.dart';

class LoginResult {
  LoginResult({
    required this.error,
    required this.message,
    required this.loginResult,
  });

  bool error;
  String message;
  Login loginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
        error: json["error"],
        message: json["message"],
        loginResult: Login.fromJson(json["loginResult"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "loginResult": loginResult.toJson(),
      };
}
