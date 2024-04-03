import 'package:default_project/screen/timer/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_images.dart';
import '../utils/appcolors.dart';
class AddPlanScreen extends StatefulWidget {
  const AddPlanScreen({super.key});

  @override
  State<AddPlanScreen> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Set Your \nTime",
              style: TextStyle(color: Colors.black, fontSize: 45.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE3E9E9),
                borderRadius: BorderRadius.circular(28.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter time",
                    style: TextStyle(
                      color: const Color(0xFF3F4949),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: TextField(
                          maxLength: 2,
                          controller: hourController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(0.1),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 0.h),
                            hintText: "  00",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            ":",
                            style: TextStyle(
                              color: const Color(0xFF161D1D),
                              fontSize: 57.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 126.w,
                        child: TextField(
                          maxLength: 2,
                          controller: minuteController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(0.1),
                            filled: true,

                            // fillColor: const Color(0xFFDDE4E3),
                            contentPadding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 0.h),
                            hintText: "  00",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.access_time),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h,),

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
            SizedBox(height: 40.h,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.r),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const TimerScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.green,
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Center(
                      child:Text("Start",style: TextStyle(color: Colors.white),),
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
