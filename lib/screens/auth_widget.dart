import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Auth extends StatelessWidget {
  const Auth({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.r),
      onTap: onTap,
      child:Container(
        width: 100.w,
        height: 100.h,
        decoration: const  BoxDecoration(
          color: AppColors.black,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,style: AppTextStyle.robotoMedium.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
