import 'package:default_project/screen/add_plan_screen.dart';
import 'package:default_project/screen/bank_screen.dart';
import 'package:default_project/screen/timer/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const BankScreen()));
              },
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: const  Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Center(
                    child: Text("Bank"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddPlanScreen()));
              },
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: const  Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Center(
                    child: Text("Timer"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
