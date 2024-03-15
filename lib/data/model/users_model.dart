class UsersModel{
  final int id;
  final String username;
  final String name;
  final String state;
  final String avatar_Url;
  UsersModel({
    required this.id,
    required this.username,
    required this.name,
    required this.state,
    required this.avatar_Url,
});
  factory UsersModel.fromJson(Map<String,dynamic> json){
  return UsersModel(
    id: json['id'] as int? ?? 0,
    username: json['username'] as String? ?? "",
    name: json['name'] as String? ?? "",
    state: json['state'] as String? ?? "",
    avatar_Url: json['avatar_url'] as String? ?? "",
  );
  }

}