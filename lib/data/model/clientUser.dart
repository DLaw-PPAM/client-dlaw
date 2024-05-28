part of 'models.dart';

class ClientUser {
  late String id;
  late String username;
  late String profilePicture;
  late String email;
  late String password;
  late String fullname;
  late DateTime birthdate;
  late String phoneNumber;
  late String address;
  late String bio;

  ClientUser({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.email,
    required this.password,
    required this.fullname,
    required this.birthdate,
    required this.phoneNumber,
    required this.address,
    required this.bio,
  });

  ClientUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    profilePicture = json['profilePicture'];
    email = json['email'];
    password = json['password'];
    fullname = json['fullname'];
    birthdate = DateTime.parse(json['birthdate']);
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    bio = json['bio'];
  }
}