import 'dart:convert';

import 'package:covid19/models/country.dart';
import 'package:covid19/models/country_day_one.dart';
import 'package:covid19/models/country_total_all_status.dart';

class Parser {
  static List<Country> parseAllCountries(String countriesString) {
    List<dynamic> decodedList = json.decode(countriesString);
    List<Country> countriesList = [];
    for (int i = 0; i < decodedList.length; i++) {
      Country country = Country(decodedList[i]['Country'],
          decodedList[i]['Slug'], decodedList[i]['ISO2']);
      countriesList.add(country);
    }
    return countriesList;
  }

  static List<CountryDayOne>parseCountryDayOne(String dayOneString){
    List<dynamic> decodeList=json.decode(dayOneString);
    List<CountryDayOne> dayOneList=[];
    for(int i=0;i<decodeList.length;i++){
      CountryDayOne dayOne=CountryDayOne(
        decodeList[i]['CountryCode'],
        decodeList[i]['Province'],
        decodeList[i]['City'],
        decodeList[i]['CityCode'],
        decodeList[i]['Lat'],
        decodeList[i]['Lon'],
        decodeList[i]['Confirmed'],
        decodeList[i]['Deaths'],
        decodeList[i]['Recovered'],
        decodeList[i]['Active'],
        decodeList[i]['Date'],
        decodeList[i]['Country'],
        null,
        null,
      );
      dayOneList.add(dayOne);
    }
    return dayOneList;
  }


  static List<CountryTotalAllStatus>parseCountryTotal(String totalString){
    List<dynamic> decodeList=json.decode(totalString);
    List<CountryTotalAllStatus> totalList=[];
    for(int i=0;i<decodeList.length;i++){
      CountryTotalAllStatus total=CountryTotalAllStatus(
        decodeList[i]['CountryCode'],
        decodeList[i]['Province'],
        decodeList[i]['City'],
        decodeList[i]['CityCode'],
        decodeList[i]['Lat'],
        decodeList[i]['Lon'],
        decodeList[i]['Confirmed'],
        decodeList[i]['Deaths'],
        decodeList[i]['Recovered'],
        decodeList[i]['Active'],
        decodeList[i]['Date'],
        decodeList[i]['Country'],
        null,
        null,
      );
      totalList.add(total);
    }
    return totalList;
  }


}
