import 'package:default_project/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/appcolors.dart';

class UniversalTextInput extends StatelessWidget {
  const UniversalTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.type,
    required this.regExp,
    required this.errorTitle,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final RegExp regExp;
  final String errorTitle;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: TextFormField(

        style: Theme.of(context).textTheme.bodyMedium,
        controller: controller,
        keyboardType: type,
        validator: (String? value) {
          if (value == null ||
              value.isEmpty ||
              value.length < 3 ||
              !regExp.hasMatch(value)) {
            return "Enter true $errorTitle";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: false,
          contentPadding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
          labelText: hintText,
          labelStyle: AppTextStyle.robotoBold.copyWith(color: Colors.grey,fontSize: 11.sp),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textInputAction: textInputAction,
      ),
    );
  }
}