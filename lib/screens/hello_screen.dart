
import 'package:default_project/screens/search.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_images.dart';
import 'category_widget.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  final ScrollController scrollController = ScrollController();

  bool isGreen = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 250) {
        setState(() {
          isGreen = true;
        });
      } else {
        setState(() {
          isGreen = false;
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              expandedHeight: 82.h,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
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
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16.sp),
                              ),
                              Text(
                                "Fahmi",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp),
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
                      Spacer(),
                      SizedBox(
                        height: 35.h,
                        width: 35.w,
                        child: InkWell(
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  AppImages.nofication,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
                width: 0.w,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: Search(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
                width: 0.w,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
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
                    const Spacer(),
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
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverPersistentHeader(pinned: true, delegate: CategoriesFoodView(onTap: () {})),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  "Best Deal",
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.sp),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 24.w, left: 24.w),
                child: Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Row(
                  children: [
                    Text(
                      "Best Price",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
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
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding:  EdgeInsets.only(left: 24.w,right: 24.w),
                  child: Container(
                    height: 180.h,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppImages.chick,fit: BoxFit.cover,),
                      ],
                    ),
                  ),
                );
              },
                childCount: 100,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.89,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
