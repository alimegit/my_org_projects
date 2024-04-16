
sealed class CountriesEvent {}

class FetchCountries extends CountriesEvent{}

class FetchCountriesByContinent extends CountriesEvent {
  FetchCountriesByContinent({required this.continent});

  final String continent;
}
class SearchCountries extends CountriesEvent {
  SearchCountries({required this.searchQuery});

  final String searchQuery;
}