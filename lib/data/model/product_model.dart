import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String qrCode;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.qrCode,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    String? qrCode,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        qrCode: qrCode ?? this.qrCode,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'qrCode': qrCode,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      qrCode: json['qrCode'],
    );
  }
}
