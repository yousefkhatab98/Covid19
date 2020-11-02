import 'package:covid19/models/country.dart';

class CountryDayOne extends Country {
  String _countryCode;
  String _province;
  String _city;
  String _cityCode;
  String _lat;
  String _lon;
  int _confirmed;
  int _deaths;
  int _recoverd;
  int _active;
  String _date;

  CountryDayOne(
    this._countryCode,
    this._province,
    this._city,
    this._cityCode,
    this._lat,
    this._lon,
    this._confirmed,
    this._deaths,
    this._recoverd,
    this._active,
    this._date,
    String country,
    String slug,
    String iso2,
  ) : super(country, slug, iso2);

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  int get active => _active;

  set active(int value) {
    _active = value;
  }

  int get recoverd => _recoverd;

  set recoverd(int value) {
    _recoverd = value;
  }

  int get deaths => _deaths;

  set deaths(int value) {
    _deaths = value;
  }

  int get confirmed => _confirmed;

  set confirmed(int value) {
    _confirmed = value;
  }

  String get lon => _lon;

  set lon(String value) {
    _lon = value;
  }

  String get lat => _lat;

  set lat(String value) {
    _lat = value;
  }

  String get cityCode => _cityCode;

  set cityCode(String value) {
    _cityCode = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get province => _province;

  set province(String value) {
    _province = value;
  }

  String get countryCode => _countryCode;

  set countryCode(String value) {
    _countryCode = value;
  }

}
