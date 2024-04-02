
import 'package:default_project/cubit/password/password_state.dart';
import 'package:default_project/data/local/storage_repository.dart';
import 'package:default_project/screens/countries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit()
      : super(PasswordState(
    password: "",
    passwordState: PasswordStatus.newPassword,
  ));

  Future<void> insertValue(BuildContext context, String v) async {
    if (state.password.length < 3) {
      emit(state.copyWithe(password: state.password + v));
    } else {
      if(state.password.length < 4){
        emit(state.copyWithe(password: state.password + v));

      }

      if (StorageRepository.getBool(key: "is_password")) {
        emit(
          state.copyWithe(
            passwordState:
            StorageRepository.getString(key: "password") == state.password
                ? PasswordStatus.pure
                : PasswordStatus.error,
          ),
        );
        _isTruePassword(context);
      } else {
        StorageRepository.setBool(key: "is_password", value: true);
        StorageRepository.setString(key: "password", value: state.password);
        emit(state.copyWithe(
          password: "",
        ));
        // _isTruePassword(context);
      }
    }
  }

  remove() {
    if (state.password.isNotEmpty) {
      emit(state.copyWithe(
          password: state.password.substring(0, state.password.length - 1)));
    } else {
      emit(state.copyWithe(isTruePassword: false));
    }
  }

  _isTruePassword(BuildContext context) {
    if (state.passwordState == PasswordStatus.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text("Invalid password :("),
        ),
      );
      emit(state.copyWithe(isTruePassword: true));
    } else if (state.passwordState == PasswordStatus.pure) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const CountriesScreen();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text(
              "Your entered code has been saved, please return the code :)"),
        ),
      );
    }
  }
}
