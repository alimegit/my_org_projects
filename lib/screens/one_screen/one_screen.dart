import 'package:default_project/bloc/auth/auth_bloc.dart';
import 'package:default_project/bloc/auth/auth_state.dart';
import 'package:default_project/data/forms/form_status.dart';
import 'package:default_project/routes.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:default_project/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/storage_repository.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({super.key});

  @override
  State<OneScreen> createState() => _OneScreenState();
}


class _OneScreenState extends State<OneScreen> {
  @override
  void initState() {
    StorageRepository.setBool(
      key: "is_new_user",
      value: true,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state.status == FormStatus.authenticated ){

    }
  },
  child: Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 290.h,
            ),
            Image.asset(AppImages.logo),
            SizedBox(
              height: 160.h,
            ),
            Text(
              "Welcome",
              style: AppTextStyle.robotoBold
                  .copyWith(color: Colors.black, fontSize: 32.w, fontWeight: FontWeight.w600),
            ),
            Text(
              "Please log in to continue and get the best \n form our app",
              style: AppTextStyle.robotoBold
                  .copyWith(color: Colors.black, fontSize: 18.w, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 79.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){},
                  child: Text(
                    "Skip",
                    style: AppTextStyle.robotoThin
                        .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                    child: Padding(
                      padding:EdgeInsets.all(8.0.w),
                      child: Row(
                        children: [
                          Text(
                            "Next ",
                            style: AppTextStyle.robotoThin
                                .copyWith(color: Colors.white, fontWeight: FontWeight.w300,fontSize: 22.w),
                          ),
                          const Icon(Icons.arrow_circle_right_outlined,color: Colors.white,)
                        ],
                      ),
                    ),
                  )

                ),
              ],
            )
          ],
        ),
      ),
    ),
);
  }
}
