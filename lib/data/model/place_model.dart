import 'package:default_project/data/model/place_category_enum.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  PlaceModel({
    required this.placeCategory,
    required this.latLng,
    required this.placeName,
    required this.entrance,
    required this.flatNumber,
    required this.orientAddress,
    required this.stage,
    this.id,
    this.image = ''
  });

  final int? id;
  LatLng latLng;
  final String image;
  final String placeName;
  PlaceCategory placeCategory;
  final String entrance;
  final String stage;
  final String flatNumber;
  final String orientAddress;
}