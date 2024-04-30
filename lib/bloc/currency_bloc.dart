
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/network/api_provider.dart';
import 'currency_event.dart';
import 'currency_state.dart';
class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitialState()) {
    on<GetCurrencyEvent>(getCurrencies);
  }

  Future<void> getCurrencies(GetCurrencyEvent event, emit) async {
    emit(CurrencyLoadingState());
    var response = await ApiProvider.getCurrencies();
    // debugPrint(response.data.toString());
    if (response.errorText.isNotEmpty) {
      emit(CurrencyErrorState(errorText: response.errorText));
    } else {
      // debugPrint("Qonnday");
      emit(CurrencySuccessState(currencies: response.data));
    }
  }
}
