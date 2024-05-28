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

var CaseList = [
  Case(
      id: 'CA01',
      subject: 'Divourse Case',
      media: 'logo.png',
      notes: 'Court Date 10-02-2024',
      status: 'Completed',
      hour: 10,
      additionFee: 10,
      lawyerId: 'L01',
      clientId: 'C01'),
  Case(
      id: 'CA02',
      subject: 'Plastic Case Coca Cola',
      media: 'logo.png',
      notes: 'None',
      status: 'Reviewing',
      hour: 0,
      additionFee: 0,
      lawyerId: 'L01',
      clientId: 'C05'),
  Case(
      id: 'CA03',
      subject: 'Inheritance Split',
      media: 'logo.png',
      notes: 'None',
      status: 'Reviewing',
      hour: 0,
      additionFee: 0,
      lawyerId: 'L02',
      clientId: 'C04'),
  Case(
      id: 'CA04',
      subject: 'Evironmental Case',
      media: 'logo.png',
      notes: 'None',
      status: 'Approved',
      hour: 10,
      additionFee: 20,
      lawyerId: 'L03',
      clientId: 'C03')
];
