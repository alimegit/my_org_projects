import 'package:default_project/screen/add_plan_screen.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_images.dart';
import '../../utils/appcolors.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  TextEditingController tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AppImages.logo,
              width: 50.w,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h,),
         Text("Reading",style: AppTextStyle.robotoMedium.copyWith(color: Colors.black,fontSize: 18.sp),),
            Center(
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 5,
                  ),
                ),
                child: Center(
                  child: Text(
                    "01:00",
                    style: AppTextStyle.robotoMedium.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 40.sp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 55.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tagController,
                decoration: InputDecoration(
                  fillColor: AppColors.cDDE4E3,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      tagController.text = "";
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.r),
                      topRight: Radius.circular(4.r),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60.h,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.r),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddPlanScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.green,
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Center(
                      child:Text("Stop",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
