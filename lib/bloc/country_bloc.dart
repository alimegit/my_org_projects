import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api/api_client.dart';
import '../data/models/country_model.dart';
import '../data/models/network_response.dart';
import 'country_event.dart';
import 'country_state.dart';



class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final ApiClient apiClient;

  CountriesBloc({required this.apiClient}) : super(CountriesInitial()) {
    on<FetchCountries>((event, emit) async {
      emit(CountriesLoading());

      NetworkResponse networkResponse = await apiClient.getCountries();

      if (networkResponse.errorText.isEmpty) {
        emit(CountriesSuccess(networkResponse.data as List<CountryModel>));
      } else {
        emit(CountriesError(networkResponse.errorText));
      }
    });

    on<FetchCountriesByContinent>((event, emit) async {
      emit(CountriesLoading());

      NetworkResponse networkResponse =
      await apiClient.getCountriesByContinents(event.continent);

      if (networkResponse.errorText.isEmpty) {
        emit(CountriesSuccess(networkResponse.data as List<CountryModel>));
      } else {
        emit(CountriesError(networkResponse.errorText));
      }
    });

    on<SearchCountries>((event, emit) async {
      emit(CountriesLoading());

      if (event.searchQuery.isNotEmpty) {
        NetworkResponse networkResponse =
        await apiClient.searchCountries(event.searchQuery);

        if (networkResponse.errorText.isEmpty) {
          countries = networkResponse.data;
          emit(CountriesSuccess(networkResponse.data as List<CountryModel>));
        } else {
          emit(CountriesError(networkResponse.errorText));
        }
      } else {
        add(FetchCountries());
      }
    });
  }
  List<CountryModel> countries = [];
}

