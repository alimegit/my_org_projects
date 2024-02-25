import 'package:flutter/material.dart';

import '../../main/weather_model.dart';
class HourlyItem{
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final List<WeatherModel> weather;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final int windGust;

  HourlyItem({
    required this.dt,
    required this.weather,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
  });
  factory HourlyItem.fromJson(Map<String,Object?> json) {
    return HourlyItem(
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      dt: json["dt"] as int? ?? 0,
      temp: json["temp"] as double? ?? 0.0,
      feelsLike: json["feelsLike"] as double? ?? 0.0,
      pressure: json["pressure"] as int? ?? 0,
      humidity: json["humidity"] as int? ?? 0,
      dewPoint: json["dewPoint"] as double? ?? 0.0,
      uvi: json["uvi"] as double? ?? 0.0,
      clouds: json["clouds"] as int? ?? 0,
      visibility: json["visibility"] as int? ?? 0,
      windSpeed: json["windSpeed"] as double? ?? 0.0,
      windDeg: json["windDeg"] as int? ?? 0,
      windGust: json["windGust"] as int? ?? 0,
    );
  }
  @override
  String toString() {
    return '''
     dt: $dt,
     temp: $temp
     feelsLike: $feelsLike
     pressure: $pressure
     humidity: $humidity
     dew_point: $dewPoint
     uvi: $uvi
     clouds: $clouds
     windSpeed: $windSpeed
     windDeg: $windDeg
     windGust: $windGust
     weather: ${weather.toString()}
    ''';
  }
}