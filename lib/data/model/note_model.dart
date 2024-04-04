
import 'dart:convert';
import 'dart:ui';

import 'package:default_project/data/model/note_model_constants.dart';
import 'package:flutter/material.dart';

// NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));
//
// String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
  int? id;
  String text;
  String title;
  String createDate;
  bool? isRemove;
  Color color;

  NoteModel({
    required this.text,
    required this.color,
    required this.title,
    required this.createDate,
    this.isRemove = false,
    this.id,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json["id"] ?? "",
    text: json["text"],
    title: json["title"],
    createDate: json["createDate"],
    isRemove: json["isRemove"],
    color: Color(json["color"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "title": title,
    "createDate": createDate,
    "isRemove": isRemove,
    "color": color.value,
  };

  Map<String, dynamic> toJsonForUpdate() => {
    NoteConstants.title: title,
    NoteConstants.text: text,
    NoteConstants.id: id,
    NoteConstants.createDate: createDate,
    NoteConstants.color: color.value.toString(),
  };

  NoteModel copyWith({
    int? id,
    String? text,
    String? title,
    String? createDate,
    bool? isRemove,
    Color? color,
  }) {
    return NoteModel(
      id: id ?? this.id,
      text: text ?? this.text,
      title: title ?? this.title,
      createDate: createDate ?? this.createDate,
      isRemove: isRemove ?? this.isRemove,
      color: color ?? this.color,
    );
  }

  static NoteModel defaultModel() {
    return NoteModel(
      text: "Ali",
      createDate: "25",
      color: Colors.white10,
      title: '',
    );
  }
}
