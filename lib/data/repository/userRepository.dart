import 'package:default_project/data/api/api_provider.dart';
import 'package:default_project/data/models/userModel.dart';
import 'package:default_project/data/network_response/network_response.dart';

class UserRepository{
  Future<bool > getSimpleWeatherInfo() async =>
     await ApiProvider().loginUser(UserModel(userName: "tester", password: "tester1"));
}