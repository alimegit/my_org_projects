import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/widget/mycards.dart';
import 'package:default_project/widget/recents.dart';
import 'package:default_project/widget/row_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/appcolors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_414A61,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 23.h, left: 33.w, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Good Morning!",
                      style: AppTextStyle.condensedMedium
                          .copyWith(color: AppColors.c_CECECE, fontSize: 18.sp),
                    ),
                    Text(
                      "John Smith",
                      style: AppTextStyle.condensedMedium
                          .copyWith(color: AppColors.c_CECECE, fontSize: 22.sp),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.john,
                    width: 60.w,
                    height: 60.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "\$8,640.00",
                  style: TextStyle(
                      color: AppColors.c_CECECE,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Available Balance",
                  style: TextStyle(
                      color: AppColors.c_CECECE,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 23.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowIcons(
                        onTap: () {},
                        icon: SvgPicture.asset(AppImages.transfer),
                        text: 'Transfer',
                      ),
                      RowIcons(
                          onTap: () {},
                          icon: SvgPicture.asset(AppImages.bills),
                          text: 'Bills'),
                      RowIcons(
                          onTap: () {},
                          icon: SvgPicture.asset(AppImages.recharge),
                          text: 'Recharge'),
                      RowIcons(
                          onTap: () {},
                          icon: SvgPicture.asset(AppImages.more),
                          text: 'More'),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Cards",
                        style: TextStyle(
                            color: AppColors.c_CECECE,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: AppColors.c_CECECE,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.c_292929,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        MyCards(
                            cardType: SvgPicture.asset(AppImages.visa),
                            cardName: "Visa Card",
                            cardNumber: "**3256",
                            cardPrice: "\$2000",
                            cardDate: "02/11"),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 0.w),
                          child: Container(
                            width: double.infinity,
                            height: 2.h,
                            decoration: BoxDecoration(
                              color: AppColors.c_CECECE,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        MyCards(
                            cardType: SvgPicture.asset(AppImages.mastercard),
                            cardName: "MasterCard",
                            cardNumber: "**3256",
                            cardPrice: "\$2000",
                            cardDate: "02/11"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Transactions",
                        style: TextStyle(
                            color: AppColors.c_CECECE,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: AppColors.c_CECECE,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.c_292929,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Recents(
                              grocery: SvgPicture.asset(AppImages.grocery),
                              name: "Grocery",
                              price: "-\$4200"),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 0.w),
                            child: Container(
                              width: double.infinity,
                              height: 2.h,
                              decoration: BoxDecoration(
                                color: AppColors.c_CECECE,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Recents(
                              grocery: SvgPicture.asset(AppImages.iesco),
                              name: "Grocery",
                              price: "-\$4200"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
