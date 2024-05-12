
import 'package:default_project/bloc/auth/auth_event.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_state.dart';
import '../../../data/forms/form_status.dart';
import '../../../data/local/storage_repository.dart';
import '../../../routes.dart';
import '../../../services/biometric_auth.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/size_utils.dart';
import '../method_two/custom_keyboard.dart';
import '../widgets/pin_put_view.dart';

class EntryPinScreen extends StatefulWidget {
  const EntryPinScreen({super.key});

  @override
  State<EntryPinScreen> createState() => _EntryPinScreenState();
}

class _EntryPinScreenState extends State<EntryPinScreen> {
  final TextEditingController pinPutController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  bool isError = false;

  String currentPin = "";

  bool biometricsEnabled = false;

  int attemptCount = 0;

  @override
  void initState() {
    biometricsEnabled = StorageRepository.getBool(key: "biometrics_enabled");
    currentPin = StorageRepository.getString(key: "pin_code");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height / 10,
          ),
          Text(
            "Pin Kodni kiriting!",
            style: AppTextStyle.robotoBold.copyWith(fontSize: 20),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            width: width / 2,
            child: PinPutTextView(
              isError: isError,
              pinPutFocusNode: focusNode,
              pinPutController: pinPutController,
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            isError ? "Pin kod noto'g'ri!" : "",
            style: AppTextStyle.robotoBold.copyWith(color: Colors.red),
          ),
          if (height > 700) SizedBox(height: 32.h),
          CustomKeyboardView(
            onFingerPrintTap: checkBiometrics,
            number: (number) {
              if (pinPutController.length < 4) {
                isError = false;
                pinPutController.text = "${pinPutController.text}$number";
              }
              if (pinPutController.length == 4) {
                if (currentPin == pinPutController.text) {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.tabBox,
                  );
                } else {
                  attemptCount++;
                  if (attemptCount == 3) {
                    context.read<AuthBloc>().add(LogoutUserEvent(userModel: UserModel(username: "username", lastname: "lastname", password: "password", email: "email", imageUrl: "imageUrl", phoneNumber: "phoneNumber", userId: "userId", fcm: "fcm", authId: "authId")));
                  }
                  isError = true;
                  pinPutController.clear();
                }
                pinPutController.text = "";
              }
              setState(() {});
            },
            isBiometricsEnabled: biometricsEnabled,
            onClearButtonTap: () {
              if (pinPutController.length > 0) {
                pinPutController.text = pinPutController.text.substring(
                  0,
                  pinPutController.text.length - 1,
                );
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == FormStatus.unauthenticated) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.loginScreen,
                      (route) => false,
                );
              }
            },
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }

  Future<void> checkBiometrics() async {
    bool authenticated = await BiometricAuthService.authenticate();
    if (authenticated) {
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(
        context,
        RouteNames.tabBox,
      );
    }
  }
}
