import 'package:default_project/hello_screen.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:default_project/view_models/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Deafult"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return   MapScreen();
                },
              ),
            );
          },
          child: const Text("GOOGLE MAPS OYNASI"),
        ),
      ),
    );
  }
}