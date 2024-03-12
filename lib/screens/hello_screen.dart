import 'package:default_project/screens/search.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_images.dart';
class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const  SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
           SliverAppBar(
             pinned: false,
             backgroundColor: Colors.white,
             expandedHeight: 82.h,
             actions: [
               InkWell(
                 borderRadius: BorderRadius.circular(15.r),
                 onTap: () {},
                 child: Container(
                   decoration: BoxDecoration(

                     border: Border.all(
                       color: AppColors.c_F9F3D0,
                       width: 2,
                     ),
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(11.r),
                   ),
                   child: Center(
                       child: SvgPicture.asset(
                     AppImages.nofication,
                     width: 30,
                   ),),
                 ),
               )
             ],
             flexibleSpace: FlexibleSpaceBar(
               background: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 24.w),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 47.h,
                     ),
                     Row(
                       children: [
                         Text(
                           "Hello,",
                           style: TextStyle(
                               color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16.sp),
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
                       style: TextStyle(
                           color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           SliverToBoxAdapter(child: SizedBox(height: 15.h, width: 0.w,),),
            SliverPersistentHeader(
              delegate: Search(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 15.h, width: 0.w,),),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,

                      fontWeight: FontWeight.w700,
                    ),
                  ),
               const  Spacer(),
                  Text(
                    "Show All",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
            // SliverPersistentHeader(delegate: Category(),)
          ],
        ),
      ),
    );
  }
}
