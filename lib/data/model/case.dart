part of 'models.dart';

class Case {
  late String id;
  late String subject;
  late String media;
  late String notes;
  late String status;
  late num hour;
  late num additionFee;
  late String lawyerId;
  late String clientId;

  Case({
    required this.id,
    required this.subject,
    required this.media,
    required this.notes,
    required this.status,
    required this.hour,
    required this.additionFee,
    required this.lawyerId,
    required this.clientId,
  });

  Case.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    media = json['media'];
    notes = json['notes'];
    status = json['status'];
    hour = json['hour'];
    additionFee = json['additionFee'];
    lawyerId = json['lawyerId'];
    clientId = json['clientId'];
  }
}

var caseList = [
  Case(
    id: '1',
    subject: 'Divorce',
    media: 'https://www.youtube.com/watch?v=9bZkp7q19f0',
    notes: 'Need help with divorce process',
    status: 'On Going',
    hour: 2,
    additionFee: 0,
    lawyerId: '1',
    clientId: '1',
  ),
  Case(
    id: '2',
    subject: 'Criminal',
    media: 'https://www.youtube.com/watch?v=9bZkp7q19f0',
    notes: 'Need help with criminal case',
    status: 'On Going',
    hour: 3,
    additionFee: 0,
    lawyerId: '1',
    clientId: '2',
  ),
  Case(
    id: '3',
    subject: 'Business',
    media: 'https://www.youtube.com/watch?v=9bZkp7q19f0',
    notes: 'Need help with business law',
    status: 'On Going',
    hour: 4,
    additionFee: 0,
    lawyerId: '2',
    clientId: '3',
  ),
  Case(
    id: '4',
    subject: 'Family',
    media: 'https://www.youtube.com/watch?v=9bZkp7q19f0',
    notes: 'Need help with family law',
    status: 'On Going',
    hour: 5,
    additionFee: 0,
    lawyerId: '2',
    clientId: '4',
  ),
];
