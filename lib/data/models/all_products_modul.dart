class AllProductModel{
  final String name;
  final int price;
  final String imageUrl;
  final int category_id;
  final int id;

  AllProductModel({
    required this.category_id,
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  factory AllProductModel.fromJson(Map<String, dynamic>json){
    return AllProductModel(
      id:json["id"] as int ?? 0,
      name: json['name'] as String ?? "",
      price: json['price'] as int ?? 0,
      imageUrl: json['image_url'] as String ?? "",
      category_id: json['category_id'] as int?? 0,
    );
  }
}
