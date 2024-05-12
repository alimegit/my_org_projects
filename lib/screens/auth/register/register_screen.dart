import 'package:default_project/bloc/auth/auth_bloc.dart';
import 'package:default_project/bloc/auth/auth_state.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:default_project/screens/tabBox/tab_box.dart';
import 'package:default_project/utils/size_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/auth/auth_event.dart';
import '../../../bloc/user/user_profile_bloc.dart';
import '../../../bloc/user/user_profile_event.dart';
import '../../../data/forms/form_status.dart';
import '../../../routes.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/appcolors.dart';
import '../login/widgets/my_custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        child: Stack(
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
                    child: Container(
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
                              "Sign Up",
                              style: AppTextStyle.robotoBold.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32.w),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              "Personal Informations",
                              style: AppTextStyle.robotoBold.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25.w),
                            ),
                            SizedBox(
                              height: 45.h,
                            ),
                            TextField(
                              controller: emailController,
                              style: AppTextStyle.robotoMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300),
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
                            TextField(
                              controller: phoneNumberController,
                              style: AppTextStyle.robotoMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300),
                              // onChanged: (v) {
                              //   setState(() {});
                              // },
                              // validator: (v) {
                              // },
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
                                hintText: "PhoneNumber",
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
                            TextField(
                              controller: passwordController,
                              style: AppTextStyle.robotoMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300),
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
                              height: 30.h,
                            ),
                            TextField(
                              controller: lastnameController,
                              style: AppTextStyle.robotoMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: AppColors.fillColor.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.buttonColor),
                                ),
                                hintText: "Last Name",
                                hintStyle: AppTextStyle.robotoMedium.copyWith(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300),
                                filled: true,
                                contentPadding: EdgeInsets.only(left: 20.w),
                              ),
                            ),
                            SizedBox(
                              height: 33.h,
                            ),
                            MyCustomButton(
                              onTap: () {
                                context.read<AuthBloc>().add(
                                  RegisterUserEvent(
                                    userModel: UserModel(
                                      username: emailController.text,
                                      lastname: lastnameController.text,
                                      password: passwordController.text,
                                      email: "${emailController.text}@gmail.com".trim(),
                                      imageUrl: "",
                                      phoneNumber: phoneNumberController.text.trim(),
                                      userId: "",
                                      fcm: "",
                                      authId: '',
                                    ),
                                  ),
                                );
                                Navigator.pushAndRemoveUntil(context, RouteNames.setPinScreen as Route<Object?>, (route) => false);
                              },
                              text: "Register",
                              isLoading: false,
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "You have an account?",
                                    style: AppTextStyle.robotoThin.copyWith(
                                        color: Colors.white, fontWeight: FontWeight.w300),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, RouteNames.loginScreen, (route) => false);
                                    },
                                    child: Text(
                                      " Login",
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
        ),
        listener: (BuildContext context, AuthState state) {
          if (state.status == FormStatus.authenticated) {
            if (state.statusMessage == "auth") {
              context.read<UserProfileBloc>().add(
                    AddUserEvent(
                      userModel: state.userModel,
                    ),
                  );
            }
            BlocProvider.of<UserProfileBloc>(context).add(
              GetCurrentUserEvent(
                uid: FirebaseAuth.instance.currentUser!.uid,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TabBox(),
              ),
            );
          }
        },
      ),
    );
  }
}
