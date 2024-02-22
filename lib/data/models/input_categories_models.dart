class InputCategoriesModels {
  final int id;
  final int categoryId;
  final String name;
  final int price;
  final String imageUrl;
  final String description;

  InputCategoriesModels(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.price,
      required this.description,
      required this.imageUrl});

  factory InputCategoriesModels.fromJson(Map<String, dynamic> json) {
    return InputCategoriesModels(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        imageUrl: json["image_url"] as String? ?? "",
        description: json["description"] as String? ?? "",
        categoryId: json["category_id"] as int? ?? 0,
        price: json["price"] as int? ?? 0);
  }
}
