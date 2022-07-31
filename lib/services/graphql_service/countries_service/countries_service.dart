import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:maqqi/model/country/country.dart';
import 'package:maqqi/services/graphql_service/graphql_client.dart';
import 'package:maqqi/services/graphql_service/countries_service/graphql/queries/country_queries.dart';
import 'package:maqqi/services/graphql_service/countries_service/graphql/mutations/country_mutations.dart';

class CountriesService {
  GraphQLClient? _client;

  // get all countries
  Future<List<Country>> getCountries() async {
    _client = await Config.initializeClient("hello");
    // query option to get all countries
    final QueryOptions options = QueryOptions(document: gql(getAllCountries));
    // result
    final QueryResult result = await _client!.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final countries = result.data!['country'];

    List<Country> _countryList =
        (countries as List).map((json) => Country.fromJson(json)).toList();
    // map to country model
    // final List<Country> countryList = countries.map((country) => Country.fromJson(country)).toList();

    // return country list
    return _countryList;
  }

  // create country
  Future<Country> createCountry(Country country) async {
    _client = await Config.initializeClient("hello");
    // query option to create country
    final MutationOptions options = MutationOptions(
      document: gql(addCountry),
      variables: {
        'name': country.Name,
        'country_code': country.CountryCode,
        'capital': country.Capital,
        'currency': country.Currency,
        'phone_code': country.PhoneCode,
        'latitude': country.Latitude,
        'longitude': country.Longitude,
      },
    );
    // result
    final QueryResult result = await _client!.mutate(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    // map to country model
    final Country newCountry =
        Country.fromJson(result.data!['insert_country_one']);
    return newCountry;
  }

  // Update country
  Future<Country> updateCountry(Country country) async {
    _client = await Config.initializeClient("hello");
    // query option to update country
    final MutationOptions options = MutationOptions(
      document: gql(updateCountryByPk),
      variables: {
        'id': country.Id,
        'name': country.Name,
        'country_code': country.CountryCode,
        'capital': country.Capital,
        'currency': country.Currency,
        'phone_code': country.PhoneCode,
        'latitude': country.Latitude,
        'longitude': country.Longitude,
      },
    );
    // result
    final QueryResult result = await _client!.mutate(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    // map to country model
    final Country updatedCountry =
        Country.fromJson(result.data!['update_country_one']);
    return updatedCountry;
  }

// delete country
  Future<Country> deleteCountry(Country country) async {
    _client = await Config.initializeClient("hello");
    // query option to delete country
    final MutationOptions options = MutationOptions(
      document: gql(deleteCountryByPk),
      variables: {
        'id': country.Id,
      },
    );
    // result
    final QueryResult result = await _client!.mutate(options);
    if (result.hasException) {
      throw new Exception(result.exception.toString());
    }
    // map to country model
    final Country deletedCountry =
        Country.fromJson(result.data!['delete_country_by_pk']);
    return deletedCountry;
  }

  // get country by id
  Future<Country> getCountryById(int id) async {
    _client = await Config.initializeClient("hello");
    // query option to get country by id
    final QueryOptions options = QueryOptions(
      document: gql(getCountryByPkId),
      variables: {
        'id': id,
      },
    );
    // result
    final QueryResult result = await _client!.query(options);
    if (result.hasException) {
      throw new Exception(result.exception.toString());
    }
    // map to country model
    final Country country = Country.fromJson(result.data!['country_by_pk']);
    return country;
  }
}
