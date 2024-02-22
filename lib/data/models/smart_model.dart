class SmartModel {
  final int id;
  final String name;
  final String image_url;
  final String created_at;

  SmartModel(
      {required this.id,
      required this.name,
      required this.image_url,
      required this.created_at});
  factory SmartModel.fromJson(Map<String,dynamic> json){
    return SmartModel(
      id:json["id"] as int? ?? 0,
      name:json["name"] as String? ?? "",
      image_url:json["image_url"] as String ? ?? "",
     created_at:json["created_at"] as String ? ?? "",

    );
  }
}
