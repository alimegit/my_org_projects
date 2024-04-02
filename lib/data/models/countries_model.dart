import 'package:default_project/data/models/continent_model.dart';

class CountryModel {
  final String code;
  final String name;
  final String phone;
  final String capital;
  final String currency;
  final String emoji;
  final ContinentModel countryContinent;

  CountryModel({
    required this.countryContinent,
    required this.code,
    required this.name,
    required this.phone,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] as String? ?? "",
      name: json['name'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      capital: json['capital'] as String? ?? "",
      currency: json['currency'] as String? ?? "",
      emoji: json['emoji'] as String? ?? "",
      countryContinent: ContinentModel.fromJson(json["continent"]),
    );
  }
}
