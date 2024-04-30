import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/currency_bloc.dart';
import '../bloc/currency_state.dart';
class BlocCurrencyScreen extends StatefulWidget {
  const BlocCurrencyScreen({super.key});

  @override
  State<BlocCurrencyScreen> createState() => _BlocCurrencyScreenState();
}

class _BlocCurrencyScreenState extends State<BlocCurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: Text(
          "All Currency",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyErrorState) {
            debugPrint("error");
            return Center(
              child: Text(state.errorText),
            );
          }
          if (state is CurrencyLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is CurrencySuccessState) {
            debugPrint(state.currencies.length.toString() + " adfgaf");
            return ListView(
              children: [
                ...List.generate(
                  state.currencies.length,
                  (index) => ListTile(
                    title: Text(state.currencies[index].title,style: const TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text("Hech qaysiga tushmadi"),
          );
        },
      ),
    );
  }
}
