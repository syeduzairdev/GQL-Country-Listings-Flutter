const String addCountry = r'''
mutation addCountry(
  $name: String!, 
  $country_code: Int!, 
  $capital: String!, 
  $currency: String!, 
  $phone_code: Int!
  $latitude: numeric !, 
  $longitude: numeric !, 
  ) {
  insert_country_one(object: {name: $name, phone_code: $phone_code, capital: $capital, country_code: $country_code, currency: $currency, longitude: $longitude, latitude: $latitude}) {
    id
    name
    phone_code
    longitude
    latitude
    currency
    country_code
    capital
  }
}
''';

const String updateCountryByPk = r'''
mutation updateCountry(
  $id: Int!, $name: String!, 
  $capital: String!, $country_code: Int!, 
  $currency: String!, $latitude: numeric!, $longitude: numeric!, 
  $phone_code: Int!) {
  update_country(where: {id: {_eq: $id}}, _set: {name: $name, phone_code: $phone_code, capital: $capital, country_code: $country_code, currency: $currency, longitude: $longitude, latitude: $latitude}) {
    returning {
      id
      name
      phone_code
      longitude
      latitude
      currency
      country_code
      capital
    }
  }
}
''';

const String deleteCountryByPk = r'''
mutation deleteCountryByPk($id: Int!) {
  delete_country_by_pk(id: $id) {
    id
  }
}
''';
