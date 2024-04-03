
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubits/bank/data_cubit.dart';
import 'cubits/bank/data_state.dart';
import 'data/model/data_model.dart';

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
        centerTitle: false,
        title: Text(
          "BanK Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
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
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp),
                ),
              );
            }
            state as SuccessBankState;
            return ListView(
              children: List.generate(state.bankData.length, (index) {
                DataModel dataModel = state.bankData[index];
                return ListTile(
                  title: Text(
                      dataModel.sender.name,style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                  subtitle: Text(dataModel.sender.location),
                  leading: Image.network(dataModel.sender.brandImage),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}