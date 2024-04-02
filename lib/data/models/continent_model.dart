class ContinentModel {
  final String code;
  final String name;

  ContinentModel({
    required this.code,
    required this.name,
  });

  factory ContinentModel.fromJson(Map<String, dynamic> json) {
    return ContinentModel(
      code: json['code'] ?? "",
      name: json['name'] ?? "",
    );
  }
}