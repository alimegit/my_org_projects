
import 'package:default_project/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../routes.dart';
import '../../../utils/app_text_style.dart';
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
      appBar: AppBar(
        title: const Text("Entry pin"),
        automaticallyImplyLeading: false,

      ),
      body: Column(
        children: [
          80.getH(),
          Text(
            "Pin kodni O'rnating!",
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
          CustomKeyboardView(
            number: (number) {
              if (pinPutController.length < 4) {
                pinPutController.text = "${pinPutController.text}$number";
              }
              if (pinPutController.length == 4) {
                Navigator.pushNamed(context, RouteNames.confirmPinScreen,
                    arguments: pinPutController.text);
                pinPutController.text = "";
              }
            },
            isBiometricsEnabled: false,
            onClearButtonTap: () {
              if (pinPutController.length > 0) {
                pinPutController.text = pinPutController.text
                    .substring(0, pinPutController.text.length - 1);
              }
            },
          )
        ],
      ),
    );
  }
}
