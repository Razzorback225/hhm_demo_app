import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrencyData{
  String currencyCode;
  String currencyName;
  String currencySymbol;

  CurrencyData(this.currencyCode, this.currencyName, this.currencySymbol);
}

class LanguagesData{
  String languageCode;
  String languageName;

  LanguagesData(this.languageCode, this.languageName);
}

class CapitalData{
  String capitalName;
  LatLng location;

  CapitalData(this.capitalName, this.location);
}

class DemonymsData{
  String gender;
  String name;

  DemonymsData(this.gender, this.name);
}