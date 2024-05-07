import 'package:default_project/bloc/card/card_bloc.dart';
import 'package:default_project/bloc/card/card_state.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Stack(
              children: [
                Image.asset(
                  AppImages.cardBackground,
                  fit: BoxFit.scaleDown,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       "MAry Canva",
                        style: AppTextStyle.robotoMedium.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                      20.getH(),
                      Row(
                        children: [
                          Image.asset(
                            AppImages.cip,
                            width: 50,
                          ),
                          const Spacer(),
                          Image.asset(
                            AppImages.nfc,
                            width: 50,
                          ),
                        ],
                      ),
                      20.getH(),
                      Text(
                        "1234 1234 1234 4321",
                        style: AppTextStyle.robotoMedium
                            .copyWith(color: Colors.black87, fontSize: 30.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 195.h),
                  child: Container(
                    width: double.infinity,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card Holder Name",
                                style: AppTextStyle.robotoThin
                                    .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                              ),
                              5.getH(),
                              Text(
                                "Maya Singh",
                                style: AppTextStyle.robotoMedium.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          60.getW(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expiry Date",
                                style: AppTextStyle.robotoThin
                                    .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                              ),
                              5.getH(),
                              Text(
                                "08/24",
                                style: AppTextStyle.robotoMedium
                                    .copyWith(color: Colors.white, fontSize: 18.sp),
                              ),
                            ],
                          ),
                          40.getW(),
                          SvgPicture.asset(AppImages.visa),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
