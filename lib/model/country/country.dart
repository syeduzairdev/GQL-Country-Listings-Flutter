import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: 'id')
  final int? Id;
  @JsonKey(name: 'name')
  final String? Name;
  @JsonKey(name: 'country_code')
  final int? CountryCode;
  @JsonKey(name: 'capital')
  final String? Capital;
  @JsonKey(name: 'currency')
  final String? Currency;
  @JsonKey(name: 'latitude')
  var Latitude;
  @JsonKey(name: 'longitude')
  var Longitude;
  @JsonKey(name: 'phone_code')
  final int? PhoneCode;

  Country({
    this.Id,
    this.CountryCode,
    this.Name,
    this.Capital,
    this.Currency,
    this.Latitude,
    this.Longitude,
    this.PhoneCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  Map<String, Object?> toMap() {
    return {
      'id': Id,
      'name': Name,
      'country_code': CountryCode,
      'capital': Capital,
      'currency': Currency,
      'latitude': Latitude,
      'longitude': Longitude,
      'phone_code': PhoneCode,
    };
  }
}
