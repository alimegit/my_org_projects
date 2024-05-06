
import 'dart:async';
import 'package:default_project/bloc/auth/auth_event.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:default_project/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_state.dart';
import '../../../data/local/storage_repository.dart';
import '../../../routes.dart';
import '../../../services/biometric_auth.dart';
import '../../../utils/app_text_style.dart';
import '../method_two/custom_keyboard.dart';
import '../widgets/pin_put_view.dart';

class EntryPinScreen extends StatefulWidget {
  const EntryPinScreen({
    super.key,
  });

  @override
  State<EntryPinScreen> createState() => _EntryPinScreenState();
}

class _EntryPinScreenState extends State<EntryPinScreen> {
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isError = false;
  bool biometricsEnabled = false;
  int attemptCount = 0;
  String currentPin = "";

  @override
  void initState() {
    biometricsEnabled = StorageRepository.getBool(key: "biometrics_enabled");
    currentPin = StorageRepository.getString(key: "pin_code");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry pin"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          60.getH(),
          Text(
            "Pin kod kiriting!",
            style: AppTextStyle.robotoMedium.copyWith(fontSize: 20),
          ),
          32.getH(),
          SizedBox(
            width: width / 2,
            child: PinPutTextView(
                pinPutFocusMode: focusNode,
                pinPutController: pinPutController,
                isError: isError),
          ),
          32.getH(),
          Text(
            isError ? "Pin kod noto'g'ri!" : "",
            style: AppTextStyle.robotoMedium
                .copyWith(fontSize: 20, color: Colors.red),
          ),
          if (height > 700) 32.getH(),
          CustomKeyboardView(
            onFingerPrintTap: checkBiometrics,
            number: (number) {
              if (pinPutController.length < 4) {
                pinPutController.text = "${pinPutController.text}$number";
              }
              if (pinPutController.length == 4) {
                if (currentPin == pinPutController.text) {
                  Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                } else {
                  attemptCount++;
                  if (attemptCount == 3) {
                    context.read<AuthBloc>().add(LogoutUserEvent(userModel: UserModel(username: "username", lastname: "lastname", password: "", email: "email", imageUrl: "imageUrl", phoneNumber: "phoneNumber", userId: "userId", fcm: "fcm", authId: "authId")));
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
                pinPutController.text = pinPutController.text
                    .substring(0, pinPutController.text.length - 1);
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
            },
            child: const SizedBox(),
          )
        ],
      ),
    );
  }

  Future<void> checkBiometrics() async {
    bool authenticated = await BiometricAuthService.authenticate();
    if (authenticated) {
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, RouteNames.tabBox);
    }
  }
}
