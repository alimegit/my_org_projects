import 'package:default_project/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/appcolors.dart';

class MyCards extends StatelessWidget {
  const MyCards(
      {super.key,
      required this.cardType,
      required this.cardName,
      required this.cardNumber,
      required this.cardPrice,
      required this.cardDate});

  final SvgPicture cardType;
  final String cardName;
  final String cardNumber;
  final String cardPrice;
  final String cardDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:  EdgeInsets.all(8.w.h),
          child: Container(
            width: 52.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Center(child: cardType),
          ),
        ),
        SizedBox(width: 10.w,),
        Column(
          children: [
            Text(
              cardName,
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
            Text(
              cardNumber,
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding:  EdgeInsets.only(right: 8.w),
          child: Column(
            children: [
              Text(
                cardPrice,
                style: TextStyle(
                    color: AppColors.c_CECECE,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp),
              ),
              Text(
                cardDate,
                style: TextStyle(
                    color: AppColors.c_CECECE,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
