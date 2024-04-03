import 'package:default_project/utils/app_images.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/bank/data_cubit.dart';
import '../cubits/bank/data_state.dart';
import '../data/model/data_model.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_C4C4C4,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Data Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => BankCubit(),
        child: BlocBuilder<BankCubit, BankState>(
          builder: (BuildContext context, state) {
            if (state is LoadingBankState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is ErrorBankState) {
              return Center(
                child: Text(
                  state.errorText,
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.sp),
                ),
              );
            }
            state as SuccessBankState;
            return ListView(
              children: List.generate(
                state.bankData.length,
                (index) {
                  DataModel dataModel = state.bankData[index];
                  return ListTile(
                    title: Text(
                      dataModel.sender.name,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30.sp),
                    ),
                    subtitle: Text(dataModel.sender.location),
                    leading: Image.network(
                      dataModel.sender.brandImage,
                      width: 90,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          AppImages.logo,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              "https://api.logobank.uz/media/logos_png/Najot_Talim-01.png",
                              width: 90,
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
