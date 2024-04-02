import 'package:default_project/data/local/storage_repository.dart';
import 'package:default_project/screens/auth_widget.dart';
import 'package:default_project/screens/countries_screen.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';

import '../cubit/password/password_cubit.dart';
import '../cubit/password/password_state.dart';
import '../services/local_auth.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  // bool auth = false;
  //
  // _init() async {
  //   final authenticated = await LocalAuth.authenticate();
  //   setState(() {
  //     auth = authenticated;
  //   });
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const CountriesScreen(),
  //     ),
  //   );
  // }
  //
  // @override
  // void initState() {
  //   _init();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          body: BlocProvider(
            create: (context) => PasswordCubit(),
            child: BlocBuilder<PasswordCubit, PasswordState>(
                builder: (BuildContext context, PasswordState state) {
              return Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: Text(
                      "Security",
                      style: AppTextStyle.robotoMedium.copyWith(
                          color: const Color(0xFF23ce6b),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      "Enter your Passcode",
                      style: AppTextStyle.robotoMedium.copyWith(
                          color: const Color(0xFF23ce6b),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          4,
                          (index) => Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration:
                                   BoxDecoration(
                                    shape: BoxShape.circle,
                                     color: index < state.password.length
                                         ? state.isTruePassword
                                         ? Colors.red
                                         : Colors.green
                                         : Colors.white10,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "1");
                            }, text: "1"),
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "2");
                            }, text: "2"),
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "3");
                            }, text: "3"),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "4");
                            }, text: "4"),
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "5");
                            }, text: "5"),
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "6");
                            }, text: "6"),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "7");
                            }, text: "7"),
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "8");
                            }, text: "8"),
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "9");
                            }, text: "9"),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .insertValue(context, "0");
                            }, text: "0"),
                            Auth(onTap: () {
                              context
                                  .read<PasswordCubit>()
                                  .remove();
                            }, text: "x"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
            // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            // floatingActionButton: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: FloatingActionButton(
            //     onPressed: () {},
            //     child: Icon(Icons.navigate_next_sharp),
            //     backgroundColor: const Color(0xFF0e162f),
            //   ),
            // ),
          ),
        ));
  }}
