part of 'models.dart';

class LawyerUser {
  late String id;
  late String clientId;
  late num pricePerHour;
  late double rating;
  late List<Specialities>? specialities;
  late User user;

  LawyerUser({
    required this.id,
    required this.clientId,
    required this.pricePerHour,
    required this.rating,
    required this.specialities,
    required this.user,
  });

  LawyerUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    pricePerHour = json['pricePerHour'];
    rating = json['rating'];
    specialities = json['specialities']
        .map<Specialities>((category) => Specialities.fromJson(category))
        .toList();
    user = User.fromJson(json['user']);
  }
}

