// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../utils/app_text_style.dart';
// class AuthTextField extends StatelessWidget {
//   const AuthTextField({super.key, required this.onChanged, required this.validator, required this.errorText, required this.hintText});
//   final VoidCallback onChanged;
//   final VoidCallback validator;
//   final String errorText;
//   final String hintText;
//
//   @override
//   Widget build(BuildContext context) {
//     return    TextFormField(
//       style: AppTextStyle.robotoMedium.copyWith(
//           color: Colors.white,
//           fontSize: 18.sp,
//           fontWeight: FontWeight.w300),
//       onChanged: onChanged,
//       validator: (v) {
//         if (v != null && AppConstants.passwordRegExp.hasMatch(v)) {
//           return null;
//         }
//         return errorText;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       decoration: InputDecoration(
//         fillColor: AppColors.fillColor.withOpacity(0.1),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0.r),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//               color: AppColors
//                   .buttonColor),
//         ),
//         hintText: hintText,
//         hintStyle: AppTextStyle.robotoMedium.copyWith(
//             color: Colors.white,
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w300),
//         filled: true,
//         contentPadding: EdgeInsets.only(left: 20.w),
//       ),
//     );
//   }
// }
