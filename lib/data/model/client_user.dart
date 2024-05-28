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

var userList = [
  ClientUser(
    id: '1',
    username: 'hotmanparis',
    profilePicture: 'https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg',
    email: 'hotman@hotmail.com',
    password: '123456',
    fullname: 'Hotman Paris',
    birthdate: DateTime(1960, 1, 1),
    phoneNumber: '08123456789',
    address: 'Jl. Gatot Subroto No. 1',
    bio: 'Lawyer',
  ),
  ClientUser(
    id: '2',
    username: 'sandraolga',
    profilePicture: 'https://cdn1-production-images-kly.akamaized.net/zO_dRrXfVk7-PJGACoaDovMaHOQ=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2244491/original/018017500_1528491342-SANDRA_OLGA_01.JPG',
    email: 'sandro@gmail.com',
    password: '123456',
    fullname: 'Sandra Olga',
    birthdate: DateTime(1980, 1, 1),
    phoneNumber: '08123456789',
    address: 'Jl. Gatot Subroto No. 2',
    bio: 'Lawyer',
  ),
  ClientUser(
    id: '3',
    username: 'Nicholas',
    profilePicture: 'https://awsimages.detik.net.id/community/media/visual/2024/04/25/viral-tren-goyang-nasi-padang-begini-asal-usulnya.jpeg?w=800',
    email: 'nik@gmail.com',
    password: '123456',
    fullname: 'Nicholas Saputra',
    birthdate: DateTime(1980, 1, 1),
    phoneNumber: '08123456789',
    address: 'Jl. Gatot Subroto No. 2',
    bio: 'Lawyer',
  ),
  ClientUser(
    id: '4',
    username: 'Abraham',
    profilePicture: 'https://yt3.googleusercontent.com/3r90Wmi5NsG6FU4yuWEiZQg8xktURGRcgaed-KB8OokYyiMZWxD0b9JzZv_gv6OXoeFVkvsFndM=s900-c-k-c0x00ffffff-no-rj',
    email: 'abraham@gmail.com',
    password: '123456',
    fullname: 'Abraham Saputra',
    birthdate: DateTime(1980, 1, 1),
    phoneNumber: '08123456789',
    address: 'Jl. Gatot Subroto No. 2',
    bio: 'Lawyer',
  ),
];
