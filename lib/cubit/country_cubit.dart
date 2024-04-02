import 'package:default_project/data/models/form_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api/api_provider.dart';
import '../data/response/response.dart';
import 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit()
      : super(CountryState(
      formStatus: FormStatus.loading, countries: [], errorText: "",));

  Future<void> callCountry() async {
    MyResponse myResponse = await ApiProvider.getCountry();
    if (myResponse.errorText.isEmpty) {
      emit(state.copyWith(countries: myResponse.data, formStatus: FormStatus.pure));
    } else {
      emit(state.copyWith(
          formStatus: FormStatus.error, errorText: myResponse.errorText));
    }
  }
}