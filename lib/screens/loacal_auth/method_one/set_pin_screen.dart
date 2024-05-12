
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../routes.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/size_utils.dart';
import '../method_two/custom_keyboard.dart';
import '../widgets/pin_put_view.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  final TextEditingController pinPutController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height / 6,
          ),
          Text(
            "Pin Kodni o'rnating!",
            style: AppTextStyle.robotoBlack.copyWith(fontSize: 20),
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
          CustomKeyboardView(
            onFingerPrintTap: () {},
            number: (number) {
              if (pinPutController.length < 4) {
                pinPutController.text = "${pinPutController.text}$number";
              }
              if (pinPutController.length == 4) {
                Navigator.pushNamed(
                  context,
                  RouteNames.confirmPinScreen,
                  arguments: pinPutController.text,
                );
                pinPutController.text = "";
              }
            },
            isBiometricsEnabled: false,
            onClearButtonTap: () {
              if (pinPutController.length > 0) {
                pinPutController.text = pinPutController.text.substring(
                  0,
                  pinPutController.text.length - 1,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
