import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/currency_bloc.dart';
import '../bloc/currency_state.dart';
import '../data/model/currency_model.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<CurrencyRepository>();
    return Scaffold(
      appBar: AppBar(title: const Text("Currencies")),
      body: Column(
        children: [
          BlocBuilder<CurrencyBloc, CurrencyState>(
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              if (state is CurrencyLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CurrencyErrorState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorText),
                  ],
                );
              } else if (state is CurrencySuccessState) {
                return Expanded(
                  child: ListView(
                    children: List.generate(state.currencies.length, (index) {
                      CurrencyModel currencyModel = state.currencies[index];
                      return ListTile(
                        onTap: () {
                                          },
                        title: Text(
                            "${currencyModel.title} ${currencyModel.cbPrice}"),
                        subtitle: Text("Qiymati: ${currencyModel.nbuBuyPrice}"),
                      );
                    }),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          // Container(
          //   height: 300,
          //   color: Colors.red,
          //   width: double.infinity,
          // ),
          BlocListener<CurrencyBloc, CurrencyState>(
            listener: (context, state) {
              if (state is CurrencySuccessState) {
                if (state.currencies.isNotEmpty) {
                  //  Navigator.
                }
              }

              // if (state is CurrencyDeletedState) {
              //   Future.microtask(
              //         () => ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(
              //         duration: Duration(seconds: 1),
              //         content: Text("DELETED"),
              //       ),
              //     ),
              //   );
              // }
            },
            child: Container(
              height: 300,
              color: Colors.red,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}