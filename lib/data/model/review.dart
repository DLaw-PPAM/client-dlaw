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
      id: 'R01',
      rating: 4.5,
      description:
          'Absolutely stellar service from this lawyer! They guided me through every step of my legal matter with expertise and professionalism. Couldn\'t have asked for a better advocate in my corner.',
      timestamp: DateTime.parse('2023-07-20 20:18:04Z'),
      lawyerId: 'L01',
      clientId: 'C01'),
  Review(
      id: 'R02',
      rating: 4.0,
      description:
          'I had a complicated legal issue, but this lawyer tackled it with finesse and skill. Their attention to detail and dedication to my case really stood out. I highly recommend their services to anyone in need of legal assistance.',
      timestamp: DateTime.parse('2023-07-20 20:18:04Z'),
      lawyerId: 'L01',
      clientId: 'C03'),
  Review(
      id: 'R01',
      rating: 1.5,
      description:
          'I had a simple legal issue, but this lawyer didnt tackled it with finesse and skill. Their attention to detail and dedication to my case really stood out as it is the worst I have seen. I highly recommend their services to anyone in need of a headache.',
      timestamp: DateTime.parse('2023-07-20 20:18:04Z'),
      lawyerId: 'L02',
      clientId: 'C03'),
  Review(
      id: 'R04',
      rating: 3.5,
      description:
          'Overall, my experience with this lawyer was okay. They were able to resolve my legal issue, but I felt like the process took longer than necessary. ',
      timestamp: DateTime.parse('2023-07-20 20:18:04Z'),
      lawyerId: 'L01',
      clientId: 'C01')
];
