
import 'package:default_project/cubits/timer/timer_cubit.dart';
import 'package:default_project/screen/timer/timer_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/plans/plan_cubit.dart';
import '../cubits/plans/plan_state.dart';

String hourText = "01";
String minuteText = "00";

class AddPlanScreen extends StatefulWidget {
  const AddPlanScreen({super.key});

  @override
  State<AddPlanScreen> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {

  String planText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set Your \nTime",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 30.h,),
                const TimeMyWidget(),
                SizedBox(height: 30.h,),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: IconButton(
                //     onPressed: () {
                //       myShowBottomSheet(context);
                //     },
                //     icon: Icon(
                //       Icons.add,
                //       size: 24.sp,
                //     ),
                //   ),
                // ),
                BlocBuilder<PlanCubit, PlanState>(
                  builder: (BuildContext context, PlanState state) {
                    return Column(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              onChanged: (v) {
                                planText = v;
                              },
                              maxLines: null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h,),
                          ],
                        ),
                        ...List.generate(
                          state.plans.length,
                              (index) {
                            return ListTile(
                              title: const Text("Vazifa"),
                              subtitle: Text(
                                state.plans[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.sp,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  context.read<PlanCubit>().deletePlan(state.plans[index]);
                                },
                                icon: Icon(
                                  Icons.dangerous_outlined,
                                  size: 22.sp,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          },
                        ),

                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    backgroundColor: Colors.green),

                onPressed: () {
                  if (hourText.isNotEmpty && minuteText.isNotEmpty) {
                    context
                        .read<TimerCubit>()
                        .setHourAndMinute(hourText, minuteText);
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const TimerScreen()));
                  }
                  context.read<PlanCubit>().addPlan(planText);
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
// myShowBottomSheet(BuildContext context) {
//
//   showModalBottomSheet(
//     context: context,
//     builder: (newContext) {
//       return Padding(
//         padding:
//         EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10.r),
//               topRight: Radius.circular(10.r),
//             ),
//           ),
//           child:
//         ),
//       );
//     },
//   );
// }

class TimeMyWidget extends StatelessWidget {
  const TimeMyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Enter time"),
         SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (v) {
                    hourText = v;
                  },
                  controller: TextEditingController(text: "01"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d+$'))
                  ],
                  maxLength: 2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                      const BorderSide(color: Colors.black, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                 SizedBox(height: 20.h,),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: TextFormField(
                  onChanged: (v) {
                    minuteText = v;
                  },
                  controller: TextEditingController(text: "00"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d+$'))
                  ],
                  maxLength: 2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                      const BorderSide(color: Colors.black, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Hour"),
              SizedBox(width: 140.w),
              const Text("Minute"),
            ],
          ),
        ],
      ),
    );
  }
}