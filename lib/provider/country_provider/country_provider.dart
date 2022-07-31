import 'package:flutter/foundation.dart';
import 'package:maqqi/model/country/country.dart';
import 'package:maqqi/services/graphql_service/countries_service/countries_service.dart';

class CountryProvider extends ChangeNotifier {
  CountriesService? _countriesService;
  // constructor
  CountryProvider() {
    // initialize countries service
    _countriesService = CountriesService();
    // get all countries
    _getCountries();
  }

  // get countries from graphql
  Future<void> _getCountries() async {
    // get all countries
    final List<Country> _countries = await _countriesService!.getCountries();
    // set countries
    countries = _countries;
  }

  // country list
  List<Country> _countries = <Country>[];
  // getter
  List<Country> get countries => _countries;
  // setter
  set countries(List<Country> value) {
    _countries = value;
    notifyListeners();
  }

  // countries list loading
  bool _isCountriesLoading = false;
  bool get isLoading => _isCountriesLoading;
  set isLoading(bool value) {
    _isCountriesLoading = value;
    notifyListeners();
  }

  // add country
  Future<Country> addCountry(Country country) async {
    // add country to service
    Country _newCountry = await _countriesService!.createCountry(country);
    // add country to list
    _countries.add(_newCountry);
    notifyListeners();
    return _newCountry;
  }

  // remove country
  Future<Country> deleteCountry(int index) async {
    // remove country from list
    Country _removedCountry = _countries.removeAt(index);
    // remove country from service
    Country _deletedCountry =
        await _countriesService!.deleteCountry(_removedCountry);
    notifyListeners();
    return _deletedCountry;
  }

  // updateCountry
  Future<Country> updateCountry(Country country) async {
    // update country from list
    Country _updateCountry = await _countriesService!.updateCountry(country);
    // update country to list
    //add(_updateCountry);
    notifyListeners();
    return _updateCountry;
  }
}
