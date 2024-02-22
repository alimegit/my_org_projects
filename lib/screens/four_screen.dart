import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../widgets/next_string_widget.dart';
import 'five_screen.dart';
class FourScreen extends StatelessWidget {
  const FourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 50.w,top: 56.h),
                child: Image.asset(AppImages.percent1,width: 467,height: 417.h,),
              ),
              SizedBox(height: 47.h),
              NextString(onTap: (){}, text: "Sales all the time", size: 18, weight: FontWeight.w700,color: AppColors.white,),
              SizedBox(height: 40.h,),
              SvgPicture.asset(AppImages.ellipse2),
              SizedBox(height: 40.h,),
              NextString(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>FiveScreen()));

              }, text: "Next", size: 14, weight: FontWeight.w700,color: AppColors.white,),
            ],
          ),

        ],
      ),
    );
  }
}
