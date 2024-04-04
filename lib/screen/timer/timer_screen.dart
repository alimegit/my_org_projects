
import 'package:default_project/cubits/timer/timer_cubit.dart';
import 'package:default_project/screen/add_plan_screen.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/plans/plan_cubit.dart';
import '../../cubits/plans/plan_state.dart';
import '../../cubits/timer/timer_state.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Timer",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddPlanScreen();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.settings,
              size: 24.sp,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const BankScreen();
          //         },
          //       ),
          //     );
          //   },
          //   icon: Icon(
          //     Icons.exit_to_app,
          //     size: 24.sp,
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TimerCubit, TimerState>(
              builder: (BuildContext context, TimerState state) {
                return Column(
                  children: [
                    SizedBox(height: 120.h,),
                   Container(
                     width: 200.w,
                     height: 200.h,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       border: Border.all(
                         width: 5,
                         color: Colors.green,
                       )
                     ),
                     child: Center(
                       child: Text(
                         "${state.hour} : ${state.minute}",
                         style: TextStyle(
                           fontSize: 45.sp,
                           fontWeight: FontWeight.w700,
                         ),
                       ),
                     ),
                   ),
                    SizedBox(height: 20.h,),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 20.h),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 13.h),
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Future.microtask(() {

                          },);
                        },
                        child: Text(
                          state.stop ? "Stop" : "Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<PlanCubit, PlanState>(
              builder: (BuildContext context, PlanState state) {
                return Column(
                  children: [
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
    );
  }
}
