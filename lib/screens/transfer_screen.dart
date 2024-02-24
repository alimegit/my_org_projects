import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_images.dart';

class TransfersScreen extends StatefulWidget {
  const TransfersScreen({super.key});

  @override
  State<TransfersScreen> createState() => _TransfersScreenState();
}

class _TransfersScreenState extends State<TransfersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 46.h, right: 15.w, left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Transfer",
                style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontWeight: FontWeight.w500,
                  fontSize: 24.sp,
                ),
              ),
            ),
            SizedBox(
              height: 47,
            ),
            Text(
              "From",
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              height: 90.h,
              decoration: BoxDecoration(
                color: AppColors.c_7485B4,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Account",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "65464511",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            Center(
              child: SvgPicture.asset(AppImages.circles),
            ),
            SizedBox(height: 10.h,),
            Text(
              "To",
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.c_7485B4,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(AppImages.plus),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.john,
                    width: 54.w,
                    height: 54.h,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.john,
                    width: 54.w,
                    height: 54.h,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.john,
                    width: 54.w,
                    height: 54.h,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.john,
                    width: 54.w,
                    height: 54.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Text(
              "Amount",
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h,),
            Text(
              "\$0.00",
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.w, vertical: 0.w),
              child: Container(
                width: double.infinity,
                height: 1.h,
                decoration: BoxDecoration(
                  color: AppColors.c_CECECE,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              "Purpose",
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30.h,),
            Text(
              "Education",
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.w, vertical: 0.w),
              child: Container(
                width: double.infinity,
                height: 1.h,
                decoration: BoxDecoration(
                  color: AppColors.c_CECECE,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            InkWell(
              borderRadius: BorderRadius.circular(20.r),
              onTap: (){},
              child: Container(
                width: double.infinity,
                height: 63.h,
                decoration: BoxDecoration(
                  color: AppColors.c_7485B4,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Send",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
