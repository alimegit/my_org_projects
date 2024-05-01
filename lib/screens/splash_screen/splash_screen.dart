import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: AppColors.splashBackground,
        body: Column(
          children: [
            Image.asset(AppImages.logo),

          ],
        ),
    );
  }
}
