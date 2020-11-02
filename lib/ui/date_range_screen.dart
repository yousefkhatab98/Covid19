import 'dart:core';
import 'package:covid19/handlers/api_handler.dart';
import 'package:covid19/models/country.dart';
import 'package:covid19/models/country_day_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';

class DateRangeScreen extends StatefulWidget {
  @override
  DateRangeScreenState createState() => DateRangeScreenState();
}

class DateRangeScreenState extends State<DateRangeScreen> {
  Country selected;
  List<Country> items = [];
  List<DateTime> picked;

  _setDate(List<DateTime> pickedDate) {
    String from = DateFormat('yyyy-MM-dd 00:00:00').format(picked[0]);
    String to = DateFormat('yyyy-MM-dd 00:00:00').format(picked[1]);
    String resultFrom = from.replaceAll(' ', 'T') + 'Z';
    String resultTo = to.replaceAll(' ', 'T') + 'Z';
    _callAllCountry(selected, resultFrom, resultTo);
  }

  _callCountries() async {
    items = await ApiHandler.getCountries();
    setState(() {
      items = items;
    });
  }

  List<CountryDayOne> countryAllData = [];

  _callAllCountry(Country selectedCnt, String from, String to) async {
    countryAllData = await ApiHandler.getCountryAll(selectedCnt, from, to);
    setState(() {
      countryAllData = countryAllData;
    });
  }

  @override
  void initState() {
    super.initState();
    _callCountries();
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
              },
            ),
            MaterialButton(
              shape: StadiumBorder(
                  side: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.primary,
              )),
              onPressed: selected == null
                  ? null
                  : () async {
                      picked = await DateRagePicker.showDatePicker(
                          context: context,
                          initialFirstDate:
                              DateTime.now().add(Duration(days: -7)),
                          initialLastDate: (DateTime.now()),
                          firstDate: DateTime(2019, 10, 30),
                          lastDate: DateTime.now());
                      if (picked != null && picked.length == 2) {
                        _setDate(picked);
                        setState(() {
                          picked = picked;
                        });
                      }
                    },
              child: new Text('pick date range'),
            ),
            !(picked != null && picked.length == 2)?Text(''):
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return new Stack(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: new Card(
                        margin: new EdgeInsets.all(20.0),
                        child: new Container(
                          child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 12, bottom: 1),
                                  child: Text(

                                    '${countryAllData[index].date}',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Country:${countryAllData[index].country}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Country Code:${countryAllData[index].countryCode}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Province:${countryAllData[index].province}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'City:${countryAllData[index].city}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'City Code:${countryAllData[index].cityCode}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Lat:${countryAllData[index].lat}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Lon:${countryAllData[index].lon}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Confirmed:${countryAllData[index].confirmed}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Deaths:${countryAllData[index].deaths}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Recoverd:${countryAllData[index].recoverd}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                child: Text(
                                  'Active:${countryAllData[index].active}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          width: double.infinity,
                          height: 180,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    new Positioned(
                      top: 0.0,
                      bottom: 0.0,
                      left: 35.0,
                      child: new Container(
                        height: double.infinity,
                        width: 1.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                    new Positioned(
                      top: 100.0,
                      left: 15.0,
                      child: new Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,

                        ),
                        child: new Container(
                          margin: new EdgeInsets.all(5.0),
                          height: 30.0,
                          width: 30.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                );
              },
              itemCount: countryAllData.length,
            ))
//            Text('${(picked != null && picked.length == 2) ? picked[0] : ''}'),
//            Text('${(picked != null && picked.length == 2) ? picked[1] : ''}'),
          ],
        ),
      ),
    );
  }
}
