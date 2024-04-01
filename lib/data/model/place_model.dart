import 'package:default_project/data/model/place_category_enum.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final String? id;
   LatLng latLng;
  final String image;
  final String placeName;
   PlaceCategory placeCategory;
  final String entrance;
  final String stage;
  final String flatNumber;
  final String orientAddress;

  PlaceModel({
    required this.placeCategory,
    required this.latLng,
    required this.placeName,
    required this.entrance,
    required this.flatNumber,
    required this.orientAddress,
    required this.stage,
     this.id,
    this.image = '',
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['doc_id'],
      latLng: LatLng(json['latLng']['latitude'], json['latLng']['longitude']),
      image: json['image'] ?? '',
      placeName: json['placeName'],
      placeCategory: PlaceCategory.values[json['placeCategory']],
      entrance: json['entrance'],
      flatNumber: json['flatNumber'],
      orientAddress: json['orientAddress'],
      stage: json['stage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': "",
      'latLng': {'latitude': latLng.latitude, 'longitude': latLng.longitude},
      'image': image,
      'placeName': placeName,
      'placeCategory': placeCategory.index,
      'entrance': entrance,
      'flatNumber': flatNumber,
      'orientAddress': orientAddress,
      'stage': stage,
    };
  }
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'latLng': {'latitude': latLng.latitude, 'longitude': latLng.longitude},
      'image': image,
      'placeName': placeName,
      'placeCategory': placeCategory.index,
      'entrance': entrance,
      'flatNumber': flatNumber,
      'orientAddress': orientAddress,
      'stage': stage,
    };
  }

  PlaceModel copyWith({
    String? id,
    LatLng? latLng,
    String? image,
    String? placeName,
    PlaceCategory? placeCategory,
    String? entrance,
    String? stage,
    String? flatNumber,
    String? orientAddress,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
      image: image ?? this.image,
      placeName: placeName ?? this.placeName,
      placeCategory: placeCategory ?? this.placeCategory,
      entrance: entrance ?? this.entrance,
      stage: stage ?? this.stage,
      flatNumber: flatNumber ?? this.flatNumber,
      orientAddress: orientAddress ?? this.orientAddress,
    );
  }
}
