class CountryNameModel {
  final String nameState;
  CountryNameModel({
    required this.nameState
  });

  factory CountryNameModel.fomJson(Map<String, dynamic> json) {
    return CountryNameModel(
        nameState: json["official"] as String? ?? "Xato");
  }
}
