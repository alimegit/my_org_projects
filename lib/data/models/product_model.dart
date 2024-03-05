import 'package:flutter/material.dart';

class ProductModel {
  ProductModel({
    required this.description,
    required this.productName,
    required this.image,
    required this.price,
    required this.productId,
  });

  final String productName;
  final double price;
  final String description;
  final String image;
  final String productId;
  static ProductModel getDefaultProduct() {
    return ProductModel(
      description: "",
      image: "",
      price: 0,
      productName: "",
      productId: "",
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json["product_name"] as String? ?? "",
      description: json["description"] as String? ?? "",
      image: json["image"] as String? ?? "",
      price: (json["price"] as num? ?? 0.0).toDouble(),
      // dateTime: DateTime.fromMillisecondsSinceEpoch(
      //     (json["_created"] as num).toInt() * 1000),
      productId: json["_uuid"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_name": productName,
      "price": price,
      "description": description,
      "color": "FF0000",
      "image": image,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "product_name": productName,
      "price": price,
      "description": description,
      "color": "FF0000",
      "image": image,
      "_uuid": productId,
    };
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}