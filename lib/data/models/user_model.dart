class UserModel {
  final String username;
  final String lastname;
  final String password;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String userId;
  final String fcm;
  final String authId;

  UserModel({
    required this.username,
    required this.lastname,
    required this.password,
    required this.email,
    required this.imageUrl,
    required this.phoneNumber,
    required this.userId,
    required this.fcm,
    required this.authId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: json["username"] ?? "",
        fcm: json["fcm"] ?? "",
        lastname: json["lastname"] ?? "",
        password: json["password"] ?? "",
        email: json["email"] ?? "",
        imageUrl: json["imageUrl"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        authId: json["authId"] ?? "",
        userId: json["userId"] ?? "");
  }

  UserModel copyWith({
    String? username,
    String? lastname,
    String? email,
    String? password,
    String? imageUrl,
    String? phoneNumber,
    String? userId,
    String? fcm,
    String? authId,
  }) {
    return UserModel(
      username: username ?? this.username,
      lastname: lastname ?? this.lastname,
      password: password ?? this.password,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
      fcm: fcm ?? this.fcm,
      authId: authId ?? this.authId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "lastname": lastname,
      "password": password,
      "email": email,
      "imageUrl": imageUrl,
      "phoneNumber": phoneNumber,
      "userId": userId,
      "fcm": fcm,
      "authId": authId
    };
  }

  static UserModel initial() => UserModel(
        username: "",
        lastname: "",
        fcm: "",
        password: "",
        email: "",
        imageUrl: "",
        phoneNumber: "",
        userId: "",
    authId: "",
      );
  Map<String, dynamic> toJsonUpdate() {
    return {
      'userName': username,
      'lastName': lastname,
      'passwordName': password,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'email': email,
      'fcm': fcm,
      'authUid': authId,
    };
  }
}
