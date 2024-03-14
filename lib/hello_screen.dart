import 'package:default_project/screens/flag.dart';
import 'package:default_project/screens/move.dart';
import 'package:default_project/screens/qorbobo.dart';
import 'package:default_project/screens/smiles.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_C4C4C4,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Flag()));
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Flag",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SnowDad()));
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Qorbobo",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Smiles()));
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Smiles",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ByMove()));
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "By Move",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
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
