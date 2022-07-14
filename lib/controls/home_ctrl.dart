import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:hhm_demo_app/controls/api_fetcher.dart';
import 'package:hhm_demo_app/models/country_data.dart';

Completer<GoogleMapController> c_controller = Completer();

Set<Marker> markers = Set<Marker>();
List<CountryData> countries = List<CountryData>.empty(growable: true);
CameraPosition initCam = CameraPosition(
  target: LatLng(50.83333333,4.0),
  zoom: 5.5
);

void goToUsr(){
  
}

void openCountryPage(){

}

void setMarkers(){
  countries.forEach(
    (country) {
      print("Add marker for ${country.countryName}");
      markers.add(
        Marker(
          markerId: MarkerId(country.countryName),
          onTap: openCountryPage,
          icon: BitmapDescriptor.defaultMarker,
          position: country.location
        )
      );
    }
  );
}