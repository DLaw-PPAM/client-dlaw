part of 'models.dart';

class LawyerUser {
  late String id;
  late String clientId;
  late num pricePerHour;
  late num rating;
  late List<Specialities> specialities;
  late List<Review>? reviews;
  late User user;

  LawyerUser({
    required this.id,
    required this.clientId,
    required this.pricePerHour,
    required this.rating,
    required this.specialities,
    required this.reviews,
    required this.user,
  });

  LawyerUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    pricePerHour = json['price_per_hour'];
    rating = json['rating'];
    specialities = json['Specialties']
        .map<Specialities>((category) => Specialities.fromJson(category))
        .toList();
    reviews = json['Reviews']
        .map<Review>((review) => Review.fromJson(review))
        .toList();
    user = User.fromJson(json['User']);
  }
}

