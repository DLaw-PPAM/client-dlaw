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

var clientList = [
  ClientUser(
      id: 'C01',
      username: 'Amrozaqy',
      profilePicture: 'logo.png',
      email: 'a@gmail.com',
      password: '123xdsaq',
      fullname: 'Ahmad Rozaqy',
      birthdate: DateTime.utc(1989, 11, 9),
      phoneNumber: '0826473910283',
      address: 'Jl Ganesha no 10',
      bio: 'Nothing'),
  ClientUser(
      id: 'C02',
      username: 'Serien',
      profilePicture: 'logo.png',
      email: 'abba@gmail.com',
      password: '12bgerds',
      fullname: 'Abba Breyn',
      birthdate: DateTime.utc(2001, 11, 9),
      phoneNumber: '0826473510283',
      address: 'Jl Ganesha no 9',
      bio: 'the corporate law wizard'),
  ClientUser(
      id: 'C03',
      username: 'Taylor',
      profilePicture: 'logo.png',
      email: 'a@gmail.com',
      password: '1234abcd',
      fullname: 'Taylor Swift',
      birthdate: DateTime.utc(1989, 11, 9),
      phoneNumber: '082647387456',
      address: 'Jl Runway no 10',
      bio: 'I\'ll fly a plane to your school'),
  ClientUser(
      id: 'C04',
      username: 'Password',
      profilePicture: 'logo.png',
      email: 'a@gmail.com',
      password: 'Username',
      fullname: 'Merry',
      birthdate: DateTime.utc(1995, 1, 9),
      phoneNumber: '0826473910282',
      address: 'Jl Ganesha no 8',
      bio: 'Username')
];
