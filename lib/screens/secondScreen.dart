import 'package:default_project/screens/third_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/widgets/next_string_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_images.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 130.h,
          ),
          Image.asset(AppImages.earth),
          SizedBox(height: 80.h,),
          Center(
            child: Text(
              "The best tech market",
              style: AppTextStyle.condensedMedium
                  .copyWith(color: AppColors.white, fontSize: 24.sp),
            ),
          ),
          SizedBox(height: 40.h,),
          SvgPicture.asset(AppImages.ellipse),
          SizedBox(height: 80.h,),
          NextString(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>ThirdScreen()));

          }, text: "Next", size: 14, weight: FontWeight.w700,color: AppColors.white,),

        ],
      ),
    );
  }
}

