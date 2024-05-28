part of 'models.dart';

class LawyerUser {
  late String id;
  late String clientId;
  late LawyerType type;
  late num pricePerHour;
  late List<LawyerType> specialities;
  late List<Review> reviews;

  LawyerUser({
    required this.id,
    required this.clientId,
    required this.pricePerHour,
    required this.specialities,
    required this.reviews,
  });

  LawyerUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    pricePerHour = json['pricePerHour'];
    specialities = List<LawyerType>.from(json['specialities'].map((x) => LawyerType.fromJson(x)));
    reviews = List<Review>.from(json['reviews'].map((x) => Review.fromJson(x)));
  }
}