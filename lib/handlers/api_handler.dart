import 'package:covid19/models/country.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:covid19/handlers/parser.dart';

class ApiHandler {
  static Future<List> getCountries() async {
    String url = 'https://api.covid19api.com/countries';
    http.Response response = await http.get(url);
    return Parser.parseAllCountries(response.body);
  }

  static Future<List>getDataOfCountry(Country selected)async{
    String url='https://api.covid19api.com/dayone/country/${selected.slug}';
    http.Response response=await http.get(url);
    return Parser.parseCountryDayOne(response.body);
  }

  static Future<List>getCountryAll(Country selected,String from,String to)async{
    String url='https://api.covid19api.com/country/${selected.slug}?from=$from&to=$to';
    http.Response response=await http.get(url);
    return Parser.parseCountryDayOne(response.body);
  }


}
