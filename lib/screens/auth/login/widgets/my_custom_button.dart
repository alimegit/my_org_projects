import 'package:default_project/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_text_style.dart';
import '../../../../utils/appcolors.dart';

class MyCustomButton extends StatefulWidget {
  const MyCustomButton({
    super.key,
    required this.onTap,
    required this.text,
     this.readyToSubmit = true,
     this.isLoading = false,
  });

  final VoidCallback onTap;
  final String text;
  final bool readyToSubmit;
  final bool isLoading;

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: widget.readyToSubmit ? widget.onTap: null,
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
            color:widget.readyToSubmit ?  AppColors.buttonColor.withOpacity(0.3).withBlue(2): Colors.grey,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child:
              widget.isLoading? const CircularProgressIndicator.adaptive():
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: AppTextStyle.robotoBold
                      .copyWith(color: Colors.white, fontSize: 25.w, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
