
import 'package:flutter/material.dart';

import '../../../data/local/storage_repository.dart';
import '../../../routes.dart';
import '../../../services/biometric_auth.dart';
import '../../auth/login/widgets/my_custom_button.dart';

class TouchIdScreen extends StatefulWidget {
  const TouchIdScreen({super.key});

  @override
  State<TouchIdScreen> createState() => _TouchIdScreenState();
}

class _TouchIdScreenState extends State<TouchIdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Touch id"),
      ),
      body: Column(
        children: [
          Icon(
            Icons.fingerprint_outlined,
            size: 100,
            color: Colors.blueAccent,
          ),
          MyCustomButton(
            text: "Biometrics Auth",
            onTap: enableBiometrics,
          ),
          MyCustomButton(
              text: "Skip",
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteNames.tabBox, (route) => false);
              })
        ],
      ),
    );
  }
  Future <void> enableBiometrics()async
  {
    bool authenticated = await BiometricAuthService.authenticate();
    if (authenticated) {
      debugPrint("----------------njnedj");
      await StorageRepository.setBool(
          key: "biometrics_enabled", value: true);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Biometrics Enabled"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Biometrics Error"),
        ),
      );
    }
    if(!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.tabBox, (route) => false);
  }
}
