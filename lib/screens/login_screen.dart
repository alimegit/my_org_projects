import 'package:default_project/screens/homescreen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_1A72DD,
      body: Column(
        children: [
          SizedBox(height: 50.h,),
          Center(
            child: Text(
              "Login",
              style: TextStyle(color: AppColors.white, fontSize: 18.sp),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.h,vertical: 40.h),
            child: TextField(
                decoration: InputDecoration(
                  fillColor: AppColors.transparent, // Or any other color you prefer
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: AppColors.white, // Or any other color you prefer
                      width: 2.0, // Border width
                    ),
                  ),
                ),

            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.h,vertical: 40.h),
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppColors.transparent, // Or any other color you prefer
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: AppColors.white, // Or any other color you prefer
                    width: 2.0, // Border width
                  ),
                ),
              ),

            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white
              ),
              child: Center(
                child: Text("Validate",style: TextStyle(color: AppColors.c_2A3256),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
