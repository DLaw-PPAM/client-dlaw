part of 'models.dart';

class Specialities {
  late String name;

  Specialities({
    required this.name,
  });

  Specialities.fromJson(Map<String, dynamic> category) {
    name = category['name'];
  }
}
