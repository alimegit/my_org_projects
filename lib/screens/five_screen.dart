import 'package:default_project/screens/login.dart';
import 'package:default_project/widgets/buttons.dart';
import 'package:default_project/widgets/next_string_widget.dart';
import 'package:default_project/widgets/two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'create_screen.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class FiveScreen extends StatelessWidget {
  const FiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Column(
        children: [
          SizedBox(
            height: 47.h,
          ),
          Center(
            child: NextString(
                onTap: () {},
                text: "Connexion",
                size: 24,
                weight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          Buttons(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>CreateScreen()));
          }, text: "Create an Account"),
          SizedBox(
            height: 32.h,
          ),
          TwoButtons(
              onTap: () {},
              text: "Connect with Google",
              color: AppColors.white,
              google: SvgPicture.asset(AppImages.google),
              color2: AppColors.c_555555),
          SizedBox(height: 16.h,),
          TwoButtons(
              onTap: () {},
              text: "Connect with Facebook",
              color: AppColors.c_415A93,
              google: SvgPicture.asset(AppImages.facebook),
              color2: AppColors.white),
          SizedBox(height: 32.h,),
          NextString(onTap: (){}, text: "Already have an account ? Login", size: 18, weight: FontWeight.w400, color: AppColors.c_FBDF00,),
          SizedBox(height: 36.h,),
          SvgPicture.asset(AppImages.ellipse2),
          SizedBox(height: 30.h,),
          NextString(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
          }, text: "Skip for now", size: 18, weight: FontWeight.w600, color: AppColors.white)


        ],
      ),
    );
  }
}
