import 'package:default_project/widget/recents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_images.dart';
import '../utils/appcolors.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
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
                "Transactions",
                style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontWeight: FontWeight.w500,
                  fontSize: 24.sp,
                ),
              ),
            ),
            SizedBox(
              height: 42.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent",
                  style: TextStyle(
                      color: AppColors.c_CECECE,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Select Time Range",
                  style: TextStyle(
                      color: AppColors.c_CECECE,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 61.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                      color: AppColors.c_414A61,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "All",
                          style: TextStyle(
                              color: AppColors.c_CECECE,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 91.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                      color: AppColors.c_414A61,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.income),
                            SizedBox(width: 5.w,),
                            Text(
                              "Income",
                              style: TextStyle(
                                  color: AppColors.c_CECECE,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 91.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                      color: AppColors.c_414A61,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.expense),
                            SizedBox(width: 5,),
                            Text(
                              "Expense",
                              style: TextStyle(
                                  color: AppColors.c_CECECE,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              "Today",
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
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
                        price: "-\$400"),
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
                        price: "-\$120"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Yesterday",
              style: TextStyle(
                  color: AppColors.c_CECECE,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h,),
            Column(
              children: [
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
                            name: "Fund Transferred",
                            price: "-\$1200"),
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
                            name: "Mobile Bill",
                            price: "-\$120"),
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
                        // Recents(
                        //     grocery: SvgPicture.asset(AppImages.iesco),
                        //     name: "Mobile Bill",
                        //     price: "-\$120"),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 10.w, vertical: 0.w),
                        //   child: Container(
                        //     width: double.infinity,
                        //     height: 2.h,
                        //     decoration: BoxDecoration(
                        //       color: AppColors.c_CECECE,
                        //       borderRadius: BorderRadius.circular(8.r),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 8.h,
                        // ),
                        // Recents(
                        //     grocery: SvgPicture.asset(AppImages.iesco),
                        //     name: "Mobile Bill",
                        //     price: "-\$120"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
