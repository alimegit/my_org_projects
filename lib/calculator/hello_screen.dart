import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../utils/app_images.dart';
import '../view_models/calculator_view_model.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var providerListen = Provider.of<CalculatorViewModel>(context);
    var provider = Provider.of<CalculatorViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.c_00223A,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Align(
        alignment: Alignment.topRight,
        child: Text(
          providerListen.text,
          style: TextStyle(
            fontSize: 24.sp,
            color: AppColors.white,
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Text(
          providerListen.result,
          style: TextStyle(
            fontSize: 28.sp,
            color: AppColors.white,
          ),
        ),),
          Container(
            // height: 455,
            decoration: BoxDecoration(
              color: AppColors.c_001B2F,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.w, 30.h, 34.w, 40.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          provider.clearText();
                        },
                        child: Text(
                          "C",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("%");
                        },
                        child: Text(
                          "%",
                          style: TextStyle(
                              color: AppColors.c_00B0D7,
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                          onTap:(){
                            provider.deleteOne();
                          },
                          child: SvgPicture.asset(
                        AppImages.delete,
                        width: 30,
                      )),
                      InkWell(
                          onTap:(){
                            provider.addText("/");
                          },
                          child: SvgPicture.asset(
                        AppImages.divider,
                        width: 25,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          provider.addText("7");
                        },
                        child: Text(
                          "7",
                          style: TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("8");
                        },
                        child: Text(
                          "8",
                          style: TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("9");
                        },
                        child: Text(
                          "9",
                          style: TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("x");
                        },
                        child: Text(
                          "x",
                          style: TextStyle(
                              color: AppColors.c_00B0D7,
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          provider.addText("4");
                        },
                        child: Text(
                          "4",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("5");
                        },
                        child: Text(
                          "5",
                          style: TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("6");
                        },
                        child: Text(
                          "6",
                          style: TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("-");
                        },
                        child: Text(
                          "--",
                          style: TextStyle(
                              color: AppColors.c_00B0D7,
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          provider.addText("1");
                        },
                        child: Text(
                          "1",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("2");
                        },
                        child: Text(
                          "2",
                          style: TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("3");
                        },
                        child: Text(
                          "3",
                          style: TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("+");
                        },
                        child: Text(
                          "+",
                          style: TextStyle(
                              color: AppColors.c_00B0D7,
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          provider.addText(".");
                        },
                        child: Text(
                          ".",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          provider.addText("0");
                        },
                        child: Text(
                          "0",
                          style: TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                          child: Icon(
                        Icons.history,
                        size: 24.sp,
                        color: AppColors.c_00B0D7,
                      )),
                      InkWell(  onTap:(){
                        provider.manualNatija();
                      },
                        child: Text(
                          "=",
                          style: TextStyle(
                              color: AppColors.c_00B0D7,
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
