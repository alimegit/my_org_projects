
import 'dart:async';
import 'package:default_project/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../data/local/storage_repository.dart';
import '../../../routes.dart';
import '../../../services/biometric_auth.dart';
import '../../../utils/app_text_style.dart';
import '../method_two/custom_keyboard.dart';
import '../widgets/pin_put_view.dart';


class ConfirmPinScreen extends StatefulWidget {
  const ConfirmPinScreen({super.key, required this.previousPin});

  final String previousPin;

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isError = false;
  bool isBiometricsEnabled = false;

  @override
  void initState() {
    BiometricAuthService.canAuthenticate().then(
          (value) {
        if (value) {
          isBiometricsEnabled = true;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entry pin"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          60.getH(),
          Text(
            "Pin qayta kirit!",
            style: AppTextStyle.robotoThin.copyWith(fontSize: 20),
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
          CustomKeyboardView(
            number: (number) {
              if (pinPutController.length < 4) {
                pinPutController.text = "${pinPutController.text}$number";
              }
              if (pinPutController.length == 4) {
                if (widget.previousPin == pinPutController.text) {
                  _setPin(pinPutController.text);
                } else {
                  isError = true;
                  pinPutController.clear();
                }
                pinPutController.text = "";
              }
              setState(() {});
            },
            isBiometricsEnabled: false,
            onClearButtonTap: () {
              if (pinPutController.length > 0) {
                pinPutController.text = pinPutController.text
                    .substring(0, pinPutController.text.length - 1);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _setPin(String pin) async {
    await StorageRepository.setString(key: "pin_code", value: pin);
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
        context,
        isBiometricsEnabled ? RouteNames.touchIdScreen : RouteNames.tabBox,
            (route) => false);
  }
}
