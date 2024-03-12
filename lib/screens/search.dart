import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: TextField(
        decoration: InputDecoration(
            fillColor: AppColors.c_F9F3D0.withOpacity(0.5),
            filled: true,
            prefixIcon:Icon(Icons.search,color: AppColors.c_573B00.withOpacity(0.3),),
            hintText:"Search",
            hintStyle: TextStyle(
              color: AppColors.c_573B00.withOpacity(0.3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(
                width: 1,
                color: AppColors.c_573B00.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide:  BorderSide(
                   width: 1.w,
                  color: AppColors.c_573B00.withOpacity(0.5),
                )
            )
        ),
      ),
    );
  }

  @override
  double get maxExtent => 40.h;

  @override
  double get minExtent => 40.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
