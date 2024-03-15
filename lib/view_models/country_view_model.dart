import 'package:default_project/data/model/country_model/countrys_model.dart';
import 'package:default_project/data/model/country_model/flag_model.dart';
import 'package:default_project/data/repository/app_repository.dart';
import 'package:flutter/cupertino.dart';
import '../data/model/users_model.dart';
class CountryViewModel extends ChangeNotifier {
  CountryViewModel({
    required this.appRepository,
  });

  final AppRepository appRepository;

  bool isLoading = false;
  List<CountryModel> countries = [];

  fetchAllCountries() async {
    isLoading = true;
    notifyListeners();
    var country = await appRepository.getCountries();
    isLoading = false;
    notifyListeners();
    print(country.length);
    if (countries.isEmpty) {
      countries = country.cast<CountryModel>();
      notifyListeners();
    }
  }
}
