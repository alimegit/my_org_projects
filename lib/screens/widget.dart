import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Fahmi extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.w,right: 24.w,),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 47.h,
              ),
              Row(
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16.sp),
                  ),
                  Text(
                    "Fahmi",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.w700, fontSize: 16.sp),
                  ),
                ],
              ),
              Text(
                "Find the right one \nfor a healthy body",
                style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),

            ],
          ),
        const   Spacer(),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 140.h;

  @override
  double get minExtent => 140.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
