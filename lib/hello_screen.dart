import 'package:default_project/routes.dart';
import 'package:default_project/screens/animation_1.dart';
import 'package:default_project/screens/animation_2.dart';
import 'package:default_project/screens/animation_3.dart';
import 'package:default_project/screens/animation_4.dart';
import 'package:default_project/screens/animation_5.dart';
import 'package:default_project/screens/animation_6.dart';
import 'package:default_project/screens/animation_7.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> routeNames = [
    //   firstScreenRoute,
    //   secondScreenRoute,
    //   thirdScreenRoute,
    //   fourthScreenRoute,
    //   fifthScreenRoute,
    //   sixthScreenRoute,
    //   seventhScreenRoute,
    //   eighthScreenRoute,
    //   ninthScreenRoute,
    //   tenthScreenRoute,
    //   eleventhScreenRoute,
    //   twelveScreenRoute,
    //   thirteenScreenRoute,
    //   fourteenScreenRoute,
    //   fifteenScreenRoute,
    //   sixteenScreenRoute,
    //   seventeenthScreenRoute,
    //   eighteenthScreenRoute,
    //   nineteenthScreenRoute,
    //   twentyScreenRoute,
    //   twentyFirstScreenRoute,
    //   twentySecondScreenRoute
    // ];
    int a = 1;
    return Scaffold(
      backgroundColor: AppColors.c_C4C4C4,
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w,20.h,12.w,0.h),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const  Animation1()));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(12.h.w),
                        child: Text(
                          " Animation 1",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const  Animation2()));

                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.h.w),
                      child: Text(
                        " Animation 2",
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>   Animation3()));

                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.h.w),
                      child: Text(
                        " Animation 3",
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const  Animation4()));

                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.h.w),
                      child: Text(
                        " Animation 4",
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>   Animation5()));

                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.h.w),
                      child: Text(
                        " Animation 5",
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const  Animation6()));

                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.h.w),
                      child: Text(
                        " Animation 6",
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const  Animation7()));

                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.h.w),
                      child: Text(
                        " Animation 7",
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
