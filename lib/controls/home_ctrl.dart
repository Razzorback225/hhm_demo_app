import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:hhm_demo_app/models/country_data.dart';

Completer<GoogleMapController> cController = Completer();
BuildContext? ctxt;
Set<Marker> markers = Set<Marker>();
List<CountryData> countries = List<CountryData>.empty(growable: true);
CameraPosition initCam = const CameraPosition(
  target: LatLng(50.83333333,4.0),
  zoom: 5.5
);

void openCountryPage(BuildContext context, CountryData country) {
  Navigator.pushNamed(context, 'country', arguments: country);
}

void setMarkers(BuildContext context){
  for (CountryData country in countries) {
    markers.add(
      Marker(
        markerId: MarkerId(country.countryName!),
        onTap: () => openCountryPage(context, country),
        icon: BitmapDescriptor.defaultMarker,
        position: country.location!
      )
    );
  }
}