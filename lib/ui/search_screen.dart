import 'dart:async';

import 'package:covid19/models/country.dart';
import 'package:covid19/models/country_day_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:covid19/handlers/api_handler.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  Country selected;

  List<Country> items = [];
  _callCountries() async {
    items = await ApiHandler.getCountries();
    setState(() {
      items = items;
    });
  }

  @override
  void initState() {
    super.initState();
    _callCountries();
  }

  List<CountryDayOne> countryData = [];

  _callDayOneOfCountry(Country selectedCnt) async {
    countryData = await ApiHandler.getDataOfCountry(selectedCnt);
    setState(() {
      countryData = countryData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          DropdownButton<Country>(
            hint: Text('Choose your country'),
            value: selected,
            items: items.map((Country cnt) {
              return new DropdownMenuItem<Country>(
                value: cnt,
                child: new Text(cnt.country.toUpperCase()),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selected = value;
              });
              _callDayOneOfCountry(value);
            },
          ),
          Expanded(child:
          ListView.builder(
              itemCount: countryData.length,
              itemBuilder: (context, position) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12, bottom: 1),
                          child: Text('${countryData[position].date}',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('Country:${countryData[position].country}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('Country Code:${countryData[position].countryCode}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('Province:${countryData[position].province}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('City:${countryData[position].city}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('City Code:${countryData[position].cityCode}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('Lat:${countryData[position].lat}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('Lon:${countryData[position].lon}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('Confirmed:${countryData[position].confirmed}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('Deaths:${countryData[position].deaths}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          child: Text('Recoverd:${countryData[position].recoverd}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 2),
                          child: Text('Active:${countryData[position].active}'),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(height:1,color: Colors.grey ,)
              ],
            );
          }))
        ],
      ),
    ));
  }
}
