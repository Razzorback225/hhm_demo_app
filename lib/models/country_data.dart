import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/models/models.dart';

class CountryData{
  String countryName;
  /*CurrencyData currencyData;*/
  String countryRegion;
  //List<LanguagesData> languages;
  LatLng location;
  double area;
  List<DemonymsData> demonyms;
  int population;
  String flagsUri;
  CapitalData? capital;
  
  CountryData(this.countryName, /*this.currencyData,*/ this.countryRegion, /*this.languages,*/ this.location, this.area, this.demonyms,this.population, this.flagsUri, {this.capital });
}