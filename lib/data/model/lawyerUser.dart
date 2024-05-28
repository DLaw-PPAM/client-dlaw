part of 'models.dart';

class LawyerUser {
  late String id;
  late String clientId;
  late num price;
  late List<Review> reviews;

  LawyerUser({
    required this.id,
    required this.clientId,
    required this.price,
    required this.reviews,
  });

  LawyerUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    price = json['price'];
    reviews = List<Review>.from(json['reviews'].map((x) => Review.fromJson(x)));
  }
}