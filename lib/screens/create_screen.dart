import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/widgets/buttons.dart';
import 'package:default_project/widgets/next_string_widget.dart';
import 'package:default_project/widgets/textFormField.dart';
import 'package:default_project/widgets/two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    passwordcontroller.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
          Padding(
          padding: EdgeInsets.symmetric(vertical: 47.h),
          child: Center(
            child: NextString(
                onTap: () {},
                text: "Create an account",
                size: 24,
                weight: FontWeight.w700,
                color: AppColors.white),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        UniversalTextFormField(
          controller: nameController,
          text: 'Full Name',
          fulltext: 'Full Name',
        ),
        SizedBox(
          height: 1.h,
        ),
        UniversalTextFormField(
          controller: nameController,
          text: 'Email',
          fulltext: 'Email',
        ),
        SizedBox(
          height: 1.h,
        ),
        UniversalTextFormField(
          controller: nameController,
          text: 'Password',
          fulltext: 'Password',
        ),
        SizedBox(height: 15.h,),
        Buttons(onTap: () {
      
        }, text: "Validate"),
        SizedBox(height: 5.h,),
        NextString(onTap: () {},
            text: "Already have an account ? Login",
            size: 14,
            weight: FontWeight.w400,
            color: AppColors.c_FBDF00),
          SizedBox(height: 20.h,),
          SvgPicture.asset(AppImages.ellipse3),
           SizedBox(height: 15.h,),
           NextString(onTap: (){}, text: "Skip for now", size: 12, weight: FontWeight.w400, color: AppColors.white)

        ],
      ),
    ),)
    ,
    );
  }
}
