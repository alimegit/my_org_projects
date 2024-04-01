import 'package:flutter/material.dart';

import 'app_text_style.dart';

showSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyle.robotoThin
            .copyWith(fontSize: 32, color: Colors.white),
      ),
    ),
  );
}