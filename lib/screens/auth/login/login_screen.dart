import 'package:default_project/bloc/auth_bloc.dart';
import 'package:default_project/bloc/auth_event.dart';
import 'package:default_project/bloc/auth_state.dart';
import 'package:default_project/routes.dart';
import 'package:default_project/screens/auth/login/widgets/line.dart';
import 'package:default_project/screens/auth/login/widgets/my_custom_button.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/forms/form_status.dart';
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
    bool isValidLoginCredentials() =>
        AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
        AppConstants.textRegExp.hasMatch(emailController.text);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(
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
                  SizedBox(
                    height: 38.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        // height: double.infinity,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32.w),
                              ),
                              SizedBox(
                                height: 45.h,
                              ),
                              TextFormField(
                                style: AppTextStyle.robotoMedium.copyWith(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300),
                                onChanged: (v) {
                                  bool validated = isValidLoginCredentials();
                                  setState(() {});
                                },
                                validator: (v) {
                                  if (v != null && AppConstants.textRegExp.hasMatch(v)) {
                                    return null;
                                  }
                                  return "Username error";
                                },
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  fillColor: AppColors.fillColor.withOpacity(0.1),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors
                                            .buttonColor), // Ustiga bosilganda chiqadigan border rangi
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                  hintText: "Username",
                                  hintStyle: AppTextStyle.robotoMedium.copyWith(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(left: 20.w),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              TextFormField(
                                style: AppTextStyle.robotoMedium.copyWith(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300),
                                onChanged: (v) {
                                  bool validated = isValidLoginCredentials();
                                  setState(() {
                                    validated;
                                  });
                                },
                                validator: (v) {
                                  if (v != null && AppConstants.passwordRegExp.hasMatch(v)) {
                                    return null;
                                  }
                                  return "Kod xato";
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  fillColor: AppColors.fillColor.withOpacity(0.1),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors
                                            .buttonColor), // Ustiga bosilganda chiqadigan border rangi
                                  ),
                                  hintText: "Password",
                                  hintStyle: AppTextStyle.robotoMedium.copyWith(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(left: 20.w),
                                ),
                              ),
                              SizedBox(
                                height: 73.h,
                              ),
                              MyCustomButton(
                                onTap: () {
                                  context.read<AuthBloc>().add(LoginUserEvent(password: passwordController.text, userName: emailController.text));
                                },
                                text: "Login",
                                readyToSubmit: isValidLoginCredentials(),
                                isLoading: state.status == FormStatus.loading,
                              ),
                              SizedBox(
                                height: 32.h,
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
                                height: 40.h,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    context.read<AuthBloc>().add(SignInWithGoogleEvent());
                                    print("dfgndfgndfngdfg");
                                  },
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
                              SizedBox(
                                height: 54.h,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don’t have an account?",
                                      style: AppTextStyle.robotoThin.copyWith(
                                          color: Colors.white, fontWeight: FontWeight.w300),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamedAndRemoveUntil(context, RouteNames.registerScreen, (route) => false);
                                      },
                                      child: Text(
                                        "  Sign Up",
                                        style: AppTextStyle.robotoThin.copyWith(
                                            color: AppColors.buttonColor,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500),
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
          );
        }, listener: (BuildContext context, AuthState state) {
          if(state.status == FormStatus.error){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage,style: AppTextStyle.robotoThin.copyWith(color: Colors.white),)));
          }
      },
      ),
    );
  }
}
