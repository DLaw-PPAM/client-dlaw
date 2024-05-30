part of 'models.dart';

class User {
  late String id;
  late String username;
  late String? profilePicture;
  late String email;
  late String password;
  late String fullname;
  late DateTime? birthdate;
  late String? phoneNumber;
  late String? address;
  late String? bio;

  User({
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    profilePicture = json['profile_picture'];
    email = json['email'];
    password = json['password'];
    fullname = json['full_name'];
    birthdate = DateTime.parse(json['birth_date']);
    phoneNumber = json['phone_number'];
    address = json['address'];
    bio = json['bio'];
  }
}
