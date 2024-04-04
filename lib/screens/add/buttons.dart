import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   return  Row(
     children: [
       InkWell(
         onTap: () {},
         borderRadius: BorderRadius.circular(15.r),
         child: Container(
           width: 40.w,
           height: 40.h,
           decoration: BoxDecoration(
               color: Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(15.r)),
           child: Center(
             child: Icon(
               Icons.arrow_back_ios_sharp,
               size: 24.sp,
               color: Colors.white,
             ),
           ),
         ),
       ),
       const Spacer(),
       InkWell(
         onTap: () {},
         borderRadius: BorderRadius.circular(15.r),
         child: Container(
           width: 40.w,
           height: 40.h,
           decoration: BoxDecoration(
               color: Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(15.r)),
           child: Center(
             child: Icon(
               Icons.remove_red_eye_outlined,
               size: 24.sp,
               color: Colors.white,
             ),
           ),
         ),
       ),
       SizedBox(
         width: 21.w,
       ),
       InkWell(
         onTap: () {},
         borderRadius: BorderRadius.circular(15.r),
         child: Container(
           width: 40.w,
           height: 40.h,
           decoration: BoxDecoration(
               color: Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(15.r)),
           child: Center(
             child: Icon(
               Icons.save_outlined,
               size: 24.sp,
               color: Colors.white,
             ),
           ),
         ),
       ),
     ],
   );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  
}