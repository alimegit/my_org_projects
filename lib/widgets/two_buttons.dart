import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class TwoButtons extends StatelessWidget {
  const TwoButtons(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      required this.google,
      required this.color2});

  final VoidCallback onTap;
  final String text;
  final Color color;
  final Color color2;
  final SvgPicture google;

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
              color: color, borderRadius: BorderRadius.circular(4.r)),
          child: Padding(
            padding: EdgeInsets.all(16.w.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                google,
                SizedBox(
                  width: 32.w,
                ),
                Text(
                  text,
                  style: AppTextStyle.condensedLight.copyWith(
                    fontSize: 18.sp,
                    color: color2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
