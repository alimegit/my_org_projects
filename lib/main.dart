import 'package:default_project/screens/riddle_screen/riddle_screen.dart';
import 'package:default_project/utils/translations/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      translations: Messages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const RiddleScreen(),
    ),
  );
}
