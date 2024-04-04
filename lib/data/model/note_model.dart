import 'dart:convert';
import 'dart:ui';

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
    id: json["id"],
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
}
