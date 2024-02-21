class GameModul {
  final int id;
  final String title;
  final String thumbnail;
  final String short_description;
  final String game_url;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String release_date;
  final String freetogame_profile_url;

  GameModul({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.short_description,
    required this.game_url,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.release_date,
    required this.freetogame_profile_url,
  });

  factory GameModul.fromJson(Map<String, dynamic> json) {
    return GameModul(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      thumbnail: json["thumbnail"] as String? ?? "",
      short_description: json["short_description"] as String? ?? "",
      game_url: json["game_url"] as String? ?? "",
      genre: json["genre"] as String? ?? "",
      platform: json["platform"] as String? ?? "",
      publisher: json["publisher"] as String? ?? "",
      developer: json["developer"] as String? ?? "",
      release_date: json["release_date"] as String? ?? "",
      freetogame_profile_url: json["freetogame_profile_url"] as String? ?? "",

    );
  }
}