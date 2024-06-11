class RegisterResult {
  RegisterResult({
    required this.error,
    required this.message,
  });

  bool error;
  String message;

  factory RegisterResult.fromJson(Map<String, dynamic> json) =>
      RegisterResult(
        error: json['error'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
      };
}
