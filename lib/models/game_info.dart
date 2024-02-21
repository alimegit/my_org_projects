import 'package:default_project/models/game_model.dart';
import 'package:flutter/material.dart';
class CarInfo {
  final List<GameModul> data;

  CarInfo({
    required this.data,
  });

  factory CarInfo.fromJson(Map<String, dynamic> json) {
    return CarInfo(
      data: (json["data"] as List?)
          ?.map((e) => GameModul.fromJson(e))
          .toList() ??
          [],
    );
  }
}