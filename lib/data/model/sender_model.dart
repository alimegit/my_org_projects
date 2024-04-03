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
      brandImage: json['brand_image'] as String? ??
          "https://api.logobank.uz/media/logos_png/Najot_Talim-01.png",
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? "",
    );
  }
}
