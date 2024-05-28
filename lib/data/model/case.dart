part of 'models.dart';

class Case {
  late String id;
  late String subject;
  late String media;
  late String notes;
  late String status;
  late num consultationFee;
  late num hourlyFee;
  late num additionFee;
  late String lawyerId;
  late String clientId;

  Case({
    required this.id,
    required this.subject,
    required this.media,
    required this.notes,
    required this.status,
    required this.consultationFee,
    required this.hourlyFee,
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
    consultationFee = json['consultationFee'];
    hourlyFee = json['hourlyFee'];
    additionFee = json['additionFee'];
    lawyerId = json['lawyerId'];
    clientId = json['clientId'];
  }
}