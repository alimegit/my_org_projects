import 'package:default_project/screens/category/category_screen.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category/allProductScreen.dart';

class HomerScreen extends StatefulWidget {
  const HomerScreen({super.key});

  @override
  State<HomerScreen> createState() => _HomerScreenState();
}

class _HomerScreenState extends State<HomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_669bbc,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>CategoriesScreen()));
              },
              child: Container(
                width: double.infinity,
                height: 20.h,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),),
                child: Center(child: Text("CategoryScreen",style: TextStyle(color: AppColors.c_028090),)),
              ),
            ),
            SizedBox(height: 10.h,),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>AllProductScreen()));

              },
              child: Container(
                width: double.infinity,
                height: 20.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),),
                child: Center(child: Text("AllProductScren",style: TextStyle(color: AppColors.c_028090),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
