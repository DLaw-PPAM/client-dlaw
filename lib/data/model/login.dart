class Login {
  Login({
    required this.userId,
    required this.token,
  });

  String userId;
  String token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        userId: json['userId'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'token': token,
      };
}
