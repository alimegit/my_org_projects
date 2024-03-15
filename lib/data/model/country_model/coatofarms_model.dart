class CoatOfArmsModel {
  final String png;
  final String svg;

  CoatOfArmsModel({
    required this.png,
    required this.svg,
  });

  factory CoatOfArmsModel.fromJson(Map<String, dynamic> json) {
    return CoatOfArmsModel(
      png: json['png'] as String? ?? "https://tfi.uz/photos/1/photos/200px-Emblem_of_Uzbekistan.svg.png",
      svg: json['svg'] as String? ?? "",
    );
  }
}