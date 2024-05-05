import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../data/forms/form_status.dart';
import '../../data/local/storage_repository.dart';
import '../../routes.dart';
import '../../utils/size_utils.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init(FormStatus formStatus) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (formStatus != FormStatus.authenticated) {
      bool isNewUser = StorageRepository.getBool(key: "is_new_user");
      if (isNewUser) {
        Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.oneScreen);
      }
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.oneScreen);
    }
  }
  @override
  void initState() {
    debugPrint("splash screen");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        child: Icon(
          Icons.access_time_filled_outlined,
          color: Colors.green,
          size: 100,
        ),
        listener: (BuildContext context, AuthState state) {
          _init(state.status);
        },
      ),
    );
  }
}