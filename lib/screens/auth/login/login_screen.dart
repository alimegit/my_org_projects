import 'package:default_project/routes.dart';
import 'package:default_project/screens/auth/login/widgets/line.dart';
import 'package:default_project/screens/auth/login/widgets/textfields.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/size_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                transform: GradientRotation(10.w),
                colors: const [
                  Color(
                    0xFF00400D,
                  ),
                  Colors.white,
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
              ),
              Image.asset(
                AppImages.logo,
                width: 210.w,
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: AppTextStyle.robotoBold.copyWith(
                          color: Colors.black, fontSize: 48.w, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Please log in to continue and get the best \nform our app",
                      style: AppTextStyle.robotoBold.copyWith(
                          color: Colors.black, fontSize: 18.w, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // height: double.infinity,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 36.h,
                          ),
                          Text(
                            "Login",
                            style: AppTextStyle.robotoBold.copyWith(
                                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 32.w),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          UniversalTextInput(
                            controller: emailController,
                            hintText: "Enter email...",
                            type: TextInputType.emailAddress,
                            regExp: AppConstants.emailRegExp,
                            errorTitle: "invalid input :(",
                          ),
                          UniversalTextInput(
                            controller: passwordController,
                            hintText: "Enter password...",
                            type: TextInputType.emailAddress,
                            regExp: AppConstants.passwordRegExp,
                            errorTitle: "invalid input :(",
                          ),
                          SizedBox(
                            height: 73.h,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 382.w,
                                height: 53.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: Offset(0, 4), // changes position of shadow
                                    ),
                                  ],
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(32.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: AppTextStyle.robotoBold.copyWith(
                                        color: Colors.white,
                                        fontSize: 25.w,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 31.h,
                          ),
                          Center(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.diamond_sharp,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: CustomPaint(
                                    painter: DiamondArrowStrokePainter(),
                                  ),
                                ),
                                Text(
                                  "  or, login with  ",
                                  style: AppTextStyle.robotoBold.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18.w),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: CustomPaint(
                                    painter: DiamondArrowStrokePainter(),
                                  ),
                                ),
                                const Icon(
                                  Icons.diamond_sharp,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 382.w,
                                height: 53.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: const Offset(0, 4), // changes position of shadow
                                    ),
                                  ],
                                  color: AppColors.buttonColor.withOpacity(0.3).withBlue(2),
                                  borderRadius: BorderRadius.circular(32.r),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.google,
                                        width: 31.w,
                                      ),
                                      Text(
                                        "  Continue with Google",
                                        style: AppTextStyle.robotoBold.copyWith(
                                            color: Colors.white,
                                            fontSize: 25.w,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?",
                                  style: AppTextStyle.robotoThin.copyWith(
                                      color: Colors.white,  fontWeight: FontWeight.w300),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushReplacementNamed(context, RouteNames.registerScreen);
                                  },
                                  child: Text(
                                    "  Sign Up",
                                    style: AppTextStyle.robotoThin.copyWith(
                                        color: AppColors.buttonColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
