import 'package:default_project/data/api/api_client.dart';
import 'package:default_project/data/models/userModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../local/storage_repository.dart';

class ApiProvider extends SecureApiClient {
  Future<bool> loginUser(
    UserModel userModel,
  ) async {
    try {
      Response response =
          await dio.post("https://quiz.4fun.uz", data: {
        "email": "tester",
        "password": "tester1",
      });
      if (response.statusCode == 200) {
        StorageRepository.putString("token", response.data["access"]);
        debugPrint("Token stored successfully}");
        return true;
      } else {
        debugPrint("Failed to register: ${response.statusCode}");
        return false;
      }
    } catch (error) {
      debugPrint("Error during registration: $error");
      return false;
    }
  }


}
