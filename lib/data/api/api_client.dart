import 'package:flutter/cupertino.dart';

import 'package:graphql/client.dart';

import '../models/country_model.dart';
import '../models/network_response.dart';
import '../queries/country-query.dart';

class ApiClient {
  ApiClient({required this.graphQLClient});

  factory ApiClient.create() {
    final _httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([_httpLink]);
    return ApiClient(
      graphQLClient: GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
  }

  final GraphQLClient graphQLClient;

  Future<NetworkResponse> getCountries() async {
    try {
      var result = await graphQLClient.query(
        QueryOptions(document: gql(countriesQuery)),
      );

      if (result.hasException) {
        return NetworkResponse(
            errorText: result.exception!.graphqlErrors.toString());
      } else {
        List<CountryModel> countries = (result.data?['countries'] as List?)
            ?.map((dynamic e) =>
            CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            [];
        debugPrint("LIST LENGTH:${countries.length}");
        return NetworkResponse(data: countries);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
    }

    return NetworkResponse();
  }

  Future<NetworkResponse> getCountriesByContinents(String continentCode) async {
    try {
      var result = await graphQLClient.query(
        //MutationOptions(document: gql(""))
        QueryOptions(document: gql(getCountryQueryByContinent(continentCode))),
      );

      if (result.hasException) {
        return NetworkResponse(
            errorText: result.exception!.graphqlErrors.toString());
      } else {
        List<CountryModel> countries = (result.data?['countries'] as List?)
            ?.map((dynamic e) =>
            CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            [];
        debugPrint("LIST LENGTH:${countries.length}");
        return NetworkResponse(data: countries);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
    }

    return NetworkResponse();
  }



  Future<NetworkResponse> searchCountries(String searchQuery) async {
    try {
      var result = await graphQLClient.query(
        QueryOptions(
          document: gql(getSearchCountriesQuery(searchQuery)),
        ),
      );

      if (result.hasException) {
        return NetworkResponse(
          errorText: result.exception!.graphqlErrors.toString(),
        );
      } else {
        List<CountryModel> countries = (result.data?['countries'] as List?)
            ?.map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            [];
        debugPrint("LIST LENGTH:${countries.length}");
        return NetworkResponse(data: countries);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
  }

  String getSearchCountriesQuery(String searchQuery) {
    return '''query SearchCountries {
  countries(filter: { name: { eq: "$searchQuery" } }) {
    code
    name
    capital
    emoji
    phone
    continent{
      name
    }
  }
}''';
  }

}




