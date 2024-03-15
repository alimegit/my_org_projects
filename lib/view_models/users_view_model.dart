import 'package:default_project/data/repository/app_repository.dart';
import 'package:flutter/cupertino.dart';
import '../data/model/users_model.dart';
class UsersViewModel extends ChangeNotifier {
  UsersViewModel({
    required this.appRepository,
  });

  final AppRepository appRepository;

  bool isLoading = false;
  List<UsersModel> users = [];

  fetchUsers() async {
    isLoading = true;
    notifyListeners();
    var user = await appRepository.getUsers();
    isLoading = false;
    notifyListeners();
    if (users.isEmpty) {
      users = user;
      notifyListeners();
    }
  }
}
