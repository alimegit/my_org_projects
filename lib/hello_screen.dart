import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_screen/chat_screen.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Chatlar",
          style: AppTextStyle.robotoMedium
              .copyWith(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_comment_outlined),
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Row(
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(width: 2.w, color: Colors.green),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(width: 2.w, color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(width: 1.w, color: Colors.black12)),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFF7F7FC),
                hintStyle: AppTextStyle.robotoRegular
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16.sp),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                },
                child: Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(width: 2.w, color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Viktoria Aviva",
                            style: AppTextStyle.robotoBold.copyWith(
                                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.sp),
                          ),
                          Text(
                            "That’s great, I look forward to hearing ba...",
                            style: AppTextStyle.robotoBold.copyWith(
                                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 11.sp),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "11:20",
                          style: AppTextStyle.robotoMedium
                              .copyWith(color: Colors.grey, fontWeight: FontWeight.w400,fontSize: 11.sp),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(180, 210, 77, 10.0),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "1",
                                style: AppTextStyle.robotoBold.copyWith(
                                    color: Colors.pink, fontWeight: FontWeight.w500, fontSize: 18.sp),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
