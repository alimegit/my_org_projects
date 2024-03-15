import 'package:default_project/data/model/country_model/countrys_model.dart';
import 'package:default_project/data/model/users_model.dart';

import '../network/api_provider.dart';

class AppRepository{
  final ApiProvider apiProvider;
  AppRepository({required this.apiProvider});
  Future<List<UsersModel>> getUsers() =>apiProvider.getUsers();
  Future<List<CountryModel>> getCountries() =>apiProvider.getCountry();

}