import 'package:default_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextString extends StatelessWidget {
  const NextString(
      {super.key,
      required this.onTap,
      required this.text,
      required this.size,
      required this.weight, required this.color});

  final VoidCallback onTap;
  final String text;
  final int size;
  final FontWeight weight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: color, fontSize: size.sp, fontWeight: weight),
      ),
    );
  }
}
