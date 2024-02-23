import 'package:default_project/data/local/storage_repo.dart';
import 'package:default_project/screens/homescreen.dart';
import 'package:default_project/screens/secondScreen.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/widgets/buttons.dart';
import 'package:default_project/widgets/next_string_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_colors.dart';
import 'login.dart';
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late SharedPreferences board;

    Future<void> _getSharedInstance() async {
      board = await SharedPreferences.getInstance();
    }
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150.h,
          ),
          Text(
            "LATECH",
            style: AppTextStyle.condensedRegular
                .copyWith(color: AppColors.white, fontSize: 34.sp),
          ),
          Text(
            "T E C H  M A R K E T",
            style: AppTextStyle.condensedMedium
                .copyWith(color: AppColors.white, fontSize: 8.sp),
          ),
          Image.asset(
            AppImages.logo,
            width: 260.w,
            height: 260.w,
          ),
          SizedBox(
            height: 88.h,
          ),
          Buttons(
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              text: "Let's start"),
          SizedBox(
            height: 48.h,
          ),
          NextString(
            onTap: () {
             if(StorageRepository.getString(key: "email")!= ""){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
    }
            },
            text: "Skip for now",
            size: 14,
            weight: FontWeight.w700,
            color: AppColors.white,
          )
          // ),
        ],
      ),);
  }
}
