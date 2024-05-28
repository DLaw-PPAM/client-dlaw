part of 'models.dart';

class LawyerUser {
  late String id;
  late String clientId;
  late num pricePerHour;
  late List<String> specialities;

  LawyerUser({
    required this.id,
    required this.clientId,
    required this.pricePerHour,
    required this.specialities,
  });

  LawyerUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    pricePerHour = json['pricePerHour'];
    specialities = List<String>.from(json['specialities']);
  }
}

var lawyerUser = [
  LawyerUser(
    id: '1',
    clientId: '1',
    pricePerHour: 100,
    specialities: ['Criminal Law', 'Civil Law'],
  ),
  LawyerUser(
    id: '3',
    clientId: '2',
    pricePerHour: 300,
    specialities: ['Criminal Law', 'Civil Law', 'Family Law', 'Corporate Law'],
  ),
];
