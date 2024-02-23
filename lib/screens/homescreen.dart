import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/widgets/next_string_widget.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_2A3256,
      body: Column(
        children: [
       NextString(onTap: (){}, text: "Keyingi", size: 24, weight: FontWeight.w900, color: AppColors.white)
        ],
      ),
    );
  }
}
