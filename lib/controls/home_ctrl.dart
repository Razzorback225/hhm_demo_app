import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

Completer<GoogleMapController> c_controller = Completer();

final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(50.83333333,4.0),
    zoom: 14.4746,
  );

void goToUsr(){
  
}