const String getAllCountries = r'''
query getAllCountries {
  country {
    id
    name
    capital
    country_code
    currency
    latitude
    longitude
    phone_code
  }
}
''';

const String getCountryByPkId = r'''
query getCountryById($id: Int!) {
  country_by_pk(id: $id) {
    id
    name
    capital
    country_code
    currency
    latitude
    longitude
    phone_code
  }
}
''';
