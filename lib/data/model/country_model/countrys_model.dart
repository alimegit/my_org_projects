import 'coatOfArms_model.dart';
import 'country_name_model.dart';
import 'flag_model.dart';

class CountryModel {
  final FlagsModel flagsModel;
  final CoatOfArmsModel coatOfArmsModel;
  final String region;
  final CountryNameModel countryNameModel;

  CountryModel(
      {required this.countryNameModel,
      required this.region,
      required this.flagsModel,
      required this.coatOfArmsModel});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      flagsModel: FlagsModel.fromJson(json["flags"]),
      coatOfArmsModel: CoatOfArmsModel.fromJson(json["coatOfArms"]),
      region: json['region'] as String? ?? "",
      countryNameModel: CountryNameModel.fomJson(json["name"]),
    );
  }
}
