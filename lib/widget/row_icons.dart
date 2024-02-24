import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/appcolors.dart';

class RowIcons extends StatelessWidget {
  const RowIcons({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final SvgPicture icon;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: onTap,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.c_DBE3F8,
              ),
              child: Center(child: icon),
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: AppColors.c_CECECE,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
