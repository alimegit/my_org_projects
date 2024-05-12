import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/user/user_profile_bloc.dart';
import '../../bloc/user/user_profile_event.dart';
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
  bool hasPin = false;

  _init(bool isAuthenticated) async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    if (isAuthenticated == false) {
      bool isNewUser = StorageRepository.getBool(key: "is_new_user");
      if (isNewUser ) {
        Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
      } else  {
        Navigator.pushReplacementNamed(context, RouteNames.oneScreen);
      }
    } else {
      Navigator.pushReplacementNamed(
          context, hasPin ? RouteNames.entryPinScreen : RouteNames.setPinScreen);
    }
  }


  @override
  void initState() {
    hasPin = StorageRepository.getString(key: "pin_code").isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == FormStatus.authenticated) {
            BlocProvider.of<UserProfileBloc>(context).add(
                GetCurrentUserEvent( uid: FirebaseAuth.instance.currentUser!.uid ));

            _init(true);
          } else {
            _init(false);
          }
        },
        child: const Center(
          child: Icon(
            Icons.comment_bank,
            color: Colors.green,
            size: 200,
          ),
        ),
      ),
    );
  }
}