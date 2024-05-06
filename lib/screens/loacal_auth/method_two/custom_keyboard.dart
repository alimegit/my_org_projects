
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/app_text_style.dart';

class CustomKeyboardView extends StatelessWidget {
  CustomKeyboardView(
      {super.key,
        required this.number,
        required this.isBiometricsEnabled,
        required this.onClearButtonTap,
        this.onFingerPrintTap});

  final ValueChanged<String> number;
  final bool isBiometricsEnabled;
  final VoidCallback onClearButtonTap;
  final VoidCallback? onFingerPrintTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          ...List.generate(
            9,
                (index) {
              return IconButton(
                onPressed: () {
                  number.call("${index + 1}");
                },
                icon: Text(
                  "${index + 1}",
                  style: AppTextStyle.robotoMedium.copyWith(fontSize: 18),
                ),
              );
            },
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.fingerprint_outlined)),
          IconButton(
              onPressed: () {
                number.call("0");
              },
              icon: Text(
                ""
                    "0",
                style: AppTextStyle.robotoThin.copyWith(fontSize: 24),
              )),
          IconButton(onPressed: onClearButtonTap, icon: Icon(Icons.backspace_outlined)),
        ],
      ),
    );
  }
}
