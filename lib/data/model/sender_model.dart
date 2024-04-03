import 'package:default_project/utils/app_images.dart';

class SenderModel {
  String brandImage;
  String name;
  String location;

  SenderModel({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      brandImage: json['brand_image'] as String? ?? "",
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? "",
    );
  }
}
//https://medium.com/@aliurinov472/dartda-konstruktorlar-haqida-f041af5f09e8
//https://medium.com/@aliurinov472/constructors-in-dart-6d259ca64af4
