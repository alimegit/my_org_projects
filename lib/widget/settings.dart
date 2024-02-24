import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/appcolors.dart';

class Settings extends StatelessWidget {
  const Settings(
      {super.key,
      required this.picture,
      required this.text,
      required this.text1});

  final SvgPicture picture;
  final String text;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 42.h,
          width: 42.w,
          decoration: BoxDecoration(
            color: AppColors.c_6A6A6A,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: picture,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,color: AppColors.c_EEEEEE),
        ),
        Spacer(),
        Text(
          text1,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600,color: AppColors.c_EEEEEE,
        ),),
      ],
    );
  }
}
