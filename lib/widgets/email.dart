import 'package:default_project/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField(
      {super.key,
        required this.controller,
        required this.text,
        required this.fulltext});

  final String text;
  final String fulltext;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fulltext,
            style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            controller: controller,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter true text";
              } else {
                return null;
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(
                color: AppColors.white,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.white, width: 1.w)),
            ),
          ),
        ],
      ),
    );
  }
}
