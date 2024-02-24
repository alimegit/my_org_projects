import 'package:default_project/screens/transactions_screen.dart';
import 'package:default_project/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../utils/app_images.dart';
import '../utils/appcolors.dart';

class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({super.key,this.onTap});
  final VoidCallback? onTap;

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 46.h, right: 15.w, left: 15.w),
        child: Column(
          children: [
            Center(child: Text(
              "May Cards",
              style: TextStyle(
                color: AppColors.c_CECECE,
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),
            )),
            SizedBox(
              height: 38.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.c_585858, AppColors.c_BECAF5],
                  ),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(AppImages.visapng, width: 44.w, height: 14.h),
                    ],
                  ),
                  Text(
                    "**** **** **** 3245 ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.c_031952.withOpacity(0.86),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Available Balance",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        "\$2,200",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "01/24",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            Center(
              child: SvgPicture.asset(AppImages.circles),
            ),
            SizedBox(
              height: 23.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.c_414A61,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Text(
                    "Make a Payment",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$220",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        "Due: Feb 10, 2022",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.white.withOpacity(0.76),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomTapAnimation(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.c_414A61,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TransactionsScreen();
                    }));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.c_414A61.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "Transactions",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 31.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.c_292929,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
                child: Column(
                  children: [

                    Settings(
                        picture: SvgPicture.asset(AppImages.iesco),
                        text: "View statement",
                        text1: ">"),
                    SizedBox(height: 10.h,),
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: AppColors.c_CECECE,
                        borderRadius: BorderRadius.circular(8.r),
                      ),

                    ),
                    SizedBox(height: 10.h,),
                    Settings(
                        picture: SvgPicture.asset(AppImages.iesco),
                        text: "Change Pin",
                        text1: ">"),
                    SizedBox(height: 10.h,),
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: AppColors.c_CECECE,
                        borderRadius: BorderRadius.circular(8.r),
                      ),

                    ),
                    SizedBox(height: 10.h,),
                    Settings(
                        picture: SvgPicture.asset(AppImages.iesco),
                        text: "Remove Card",
                        text1: ">"),
                    SizedBox(height: 10.h,),
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
