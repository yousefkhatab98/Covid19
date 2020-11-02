
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
class MapsScreen extends StatefulWidget{
  @override
  MapsScreenState createState() =>MapsScreenState();

}
class MapsScreenState extends State<MapsScreen>{
  GoogleMapController mapController;
  var currentLocation=Position();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getLocation();
  }


  void _getLocation() async {
    if (await Geolocator().isLocationServiceEnabled()) {
      currentLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 11,
          target:
          LatLng(currentLocation.latitude, currentLocation.longitude))));
    } else {
      print('Location service is not enabled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target:LatLng(22.5225,33.2565) ,
          zoom: 16.0,
        ),
      ),
    );

  }

}