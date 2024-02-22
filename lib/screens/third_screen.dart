import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/widgets/next_string_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_images.dart';
import 'four_screen.dart';
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(right: 100.w,top: 76.h),
                child: Image.asset(AppImages.computer,width: 390.w,height: 410.h,),
              ),
              SizedBox(height: 47.h),
              NextString(onTap: (){}, text: "A lot of exclusives", size: 18, weight: FontWeight.w700,color: AppColors.white,),
              SizedBox(height: 40.h,),
              SvgPicture.asset(AppImages.ellipse1),
              SizedBox(height: 40.h,),
              NextString(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>FourScreen()));
              }, text: "Next", size: 14, weight: FontWeight.w700,color: AppColors.white,),
            ],
          ),

        ],
      ),
    );
  }
}
