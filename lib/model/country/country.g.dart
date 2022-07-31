part of 'country.dart';

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      Id: json['id'],
      Name: json['name'],
      CountryCode: json['country_code'],
      Capital: json['capital'],
      Currency: json['currency'],
      Latitude: json['latitude'],
      Longitude: json['longitude'],
      PhoneCode: json['phone_code'],
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.Id,
      'name': instance.Name,
      'country_code': instance.CountryCode,
      'capital': instance.Capital,
      'currency': instance.Currency,
      'latitude': instance.Latitude,
      'longitude': instance.Longitude,
      'phone_code': instance.PhoneCode,
    };
