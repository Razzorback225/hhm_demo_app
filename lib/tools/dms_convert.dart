import 'package:google_maps_flutter/google_maps_flutter.dart';

extension ToDMS on LatLng{
  DMSCoordinates convertToDMS(){
    double lat = latitude;
    double long = longitude;

    double latDeg = double.tryParse(lat.toString().split('.')[0])!.abs(); 
    double longDeg = double.tryParse(long.toString().split('.')[0])!.abs();

    double? latMin = (lat.abs() - latDeg) * 60.0;
    double? longMin = (long.abs() - longDeg) * 60.0;

    double latSec = (latMin - double.tryParse(latMin.toString().split('.')[0])!) * 60; 
    double longSec = (longMin - double.tryParse(longMin.toString().split('.')[0])!) * 60;

    String latCard;
    String longCard;

    if(lat < 0){
      latCard = 'S';
    }
    else{
      latCard = 'N';
    }

    if(long < 0){
      longCard = 'W';
    }
    else{
      longCard = 'E';
    }

    return DMSCoordinates(
      lat: "${latDeg.abs().toInt()}° ${latMin.toInt()}' ${latSec.toStringAsFixed(4)}\" $latCard",
      long : "${longDeg.abs().toInt()}° ${longMin.toInt()}' ${longSec.toStringAsFixed(4)}\" $longCard"
    );
  }
}

class DMSCoordinates{
  String? lat;
  String? long;

  DMSCoordinates({this.lat, this.long});
}