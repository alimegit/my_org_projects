import '../../data/models/countries_model.dart';
import '../../data/models/form_status.dart';

class CountryState {
  List<CountryModel> countries;
  FormStatus formStatus;
  String errorText;

  CountryState({
    required this.formStatus,
    required this.countries,
    required this.errorText,
  });

  CountryState copyWith({
    List<CountryModel>? countries,
    FormStatus? formStatus,
    String? errorText,
  }) {
    return CountryState(
      countries: countries ?? this.countries,
      formStatus: formStatus ?? this.formStatus,
      errorText: errorText ?? this.errorText,
    );
  }
}
