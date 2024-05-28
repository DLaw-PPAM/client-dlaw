part of 'models.dart';

class Review {
  late String id;
  late num rating;
  late String description;
  late DateTime timestamp;
  late String lawyerId;
  late String clientId;

  Review({
    required this.id,
    required this.rating,
    required this.description,
    required this.timestamp,
    required this.lawyerId,
    required this.clientId,
  });

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    description = json['description'];
    timestamp = DateTime.parse(json['timestamp']);
    lawyerId = json['lawyerId'];
    clientId = json['clientId'];
  }
}

var reviewList = [
  Review(
    id: '1',
    rating: 4.5,
    description: 'Great lawyer, very helpful',
    timestamp: DateTime.now(),
    lawyerId: '1',
    clientId: '1',
  ),
  Review(
    id: '2',
    rating: 3.5,
    description: 'Good lawyer, but need to improve',
    timestamp: DateTime.now(),
    lawyerId: '2',
    clientId: '2',
  ),
  Review(
    id: '3',
    rating: 5,
    description: 'Excellent lawyer, very professional',
    timestamp: DateTime.now(),
    lawyerId: '1',
    clientId: '3',
  ),
  Review(
    id: '4',
    rating: 4,
    description: 'Very helpful lawyer, highly recommended',
    timestamp: DateTime.now(),
    lawyerId: '2',
    clientId: '4',
  ),
];