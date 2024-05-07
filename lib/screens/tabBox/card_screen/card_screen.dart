import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            60.getH(),
            SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    Image.asset(AppImages.cardBackground),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Milliy Bank",
                            style: AppTextStyle.robotoMedium.copyWith(
                                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 25),
                          ),
                          20.getH(),
                          Row(
                            children: [
                              Image.asset(AppImages.cip,width: 50,),
                              const Spacer(),
                              Image.asset(AppImages.nfc,width: 50,),

                            ],
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 175.h),
                      child: Container(
                        width: double.infinity,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
