import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/appcolors.dart';

class Recents extends StatelessWidget {
  const Recents(
      {super.key,
      required this.grocery,
      required this.name,
      required this.price});

  final SvgPicture grocery;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.c_FFDEE2,
          ),
          child: Center(child: grocery),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          name,
          style: TextStyle(
              color: AppColors.c_CECECE,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(
              color: AppColors.c_CECECE,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
