part of "models.dart";

class DetailLawyer {
  late String id;
  late String clientId;
  late num pricePerHour;
  late double rating;
  late List<Specialities> specialities;
  late User user;
  late List<Review> reviews;

  DetailLawyer({
    required this.id,
    required this.clientId,
    required this.pricePerHour,
    required this.rating,
    required this.specialities,
    required this.user,
    required this.reviews,
  });

  DetailLawyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    pricePerHour = json['pricePerHour'];
    rating = json['rating'];
    specialities = json['specialities']
        .map<Specialities>((category) => Specialities.fromJson(category))
        .toList();
    user = User.fromJson(json['user']);
    reviews = json['reviews']
        .map<Review>((review) => Review.fromJson(review))
        .toList();
  }
}