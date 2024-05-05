import 'package:default_project/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/forms/form_status.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormStatus status;
  final UserModel userModel;

  const AuthState({
    required this.errorMessage,
    required this.statusMessage,
    required this.status,
    required this.userModel,
  });

  AuthState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormStatus? status,
    UserModel? userModel,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        statusMessage,
        errorMessage,
        userModel,
      ];
}
