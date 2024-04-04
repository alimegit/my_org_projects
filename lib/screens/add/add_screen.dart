import 'package:default_project/screens/add/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/appcolors.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 47.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 21.w,
                  ),
                  InkWell(
                    onTap: () {
            SaveDialog();
                    },
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: const Color(0xFF3B3B3B), borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Icon(
                          Icons.save_outlined,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              TextField(
                textInputAction: TextInputAction.next,
                controller: titleController,
                maxLength: null,
                maxLines: null,
                onChanged: (v) {},
                cursorColor: AppColors.c_CCCCCC,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(
                      color: AppColors.c_9A9A9A,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: AppColors.c_252525)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: AppColors.c_252525))),
              ),
              TextField(
                textInputAction: TextInputAction.done,
                controller: subTitleController,
                maxLength: null,
                maxLines: null,
                cursorColor: AppColors.c_CCCCCC,
                style: TextStyle(
                  color: AppColors.c_FFFFFF,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                    hintText: "Type something...",
                    hintStyle: TextStyle(
                      color: AppColors.c_9A9A9A,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: AppColors.c_252525)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: AppColors.c_252525))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
