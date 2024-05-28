class LawyerType {
  late String name;

  LawyerType({
    required this.name,
  });

  LawyerType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
