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
  late LawyerUser lawyer;

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
    required this.lawyer,
  });

  Case.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    media = json['media'];
    notes = json['notes'];
    status = json['status'];
    hour = json['hour'];
    additionFee = json['addition_fee'];
    lawyerId = json['lawyer_id'];
    clientId = json['client_id'];
    lawyer = LawyerUser.fromJson(json['Lawyer']);
  }
}
