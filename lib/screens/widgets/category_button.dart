import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/app_images.dart';

categoryButton({
  required ValueChanged<int> callIndex,
  required ValueChanged<String> imagePath,
}) {
  int activeIndex = -1;
  List<String> text = [
    'home',
    'other',
    'work'
  ];
  List<String> image = [
    AppImages.home,
    AppImages.other,
    AppImages.work
  ];
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return  Padding(
        padding: EdgeInsets.only(top: 650, left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(text.length, (index) =>
                ZoomTapAnimation(
                  onTap: (){
                    activeIndex = index;
                    callIndex.call(activeIndex);
                    imagePath.call(image[index]);
                    setState((){});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.w),
                      color: activeIndex == index ? Colors.amber : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          image[index],
                          width: 26.w,
                          color: activeIndex == index ? Colors.white : Colors.black,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          text[index],
                          style: TextStyle(
                            fontSize: 22.w,
                            color: activeIndex == index ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      );
    },
  );
}
