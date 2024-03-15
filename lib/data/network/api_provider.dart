import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/country_model/countrys_model.dart';
import '../model/users_model.dart';

class ApiProvider {
  Future<List<UsersModel>> getUsers() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://fifth-exam.free.mockoapp.net/users"),
      );
      if (response.statusCode == HttpStatus.ok) {
        return (jsonDecode(response.body) as List?)?.map((e) => UsersModel.fromJson(e)).toList() ??
            [];
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }
  Future<List<CountryModel>> getCountry() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/all"),
      );
      if (response.statusCode == HttpStatus.ok) {
        return (jsonDecode(response.body) as List?)?.map((e) => CountryModel.fromJson(e)).toList() ??
            [];
      }
      return [];
    } catch (error) {
      rethrow;
    }
  }
}
