import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;

  static const Color c_1A72DD = Color(0xFF1A72DD);
  static const Color c_F4261A = Color(0xFFF4261A);
  static const Color c_2A3256 = Color(0xFF2A3256);
  static const Color c_C4C4C4= Color(0xFFC4C4C4);
  static const Color c_e76f51= Color(0xFFe76f51);
  static const Color splashBackground= Color(0xFFC1F2B0);
  static const Color buttonColor= Color(0xFF00861D);
  static const Color containerColor= Color(0xFF2B2B2B);
  static const Color fillColor= Color(0xFF000000);
  static const LinearGradient scaffoldBackground =  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF00861D), // Boshlang'ich rang
      Color(0xFFFFFFFF), // O'ng tarafdagi rang
    ],
  );
}