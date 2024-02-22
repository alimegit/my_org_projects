import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(4.r)),
          child: Padding(
            padding: EdgeInsets.all(16.w.h),
            child: Center(
              child: Text(
                text,
                style: AppTextStyle.condensedLight
                    .copyWith(color: AppColors.c_0001FC,fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
