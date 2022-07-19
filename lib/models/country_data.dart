import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryData{
  String? countryName;
  Currencies? currenciesList;
  String? countryRegion;
  List<LanguagesData>? languages;
  LatLng? location;
  double? area;
  Demonyms? demonyms;
  int? population;
  String? flagUri;
  CapitalData? capital;
  
  CountryData(
    {
      this.countryName, 
      this.currenciesList, 
      this.countryRegion, 
      this.languages, 
      this.location, 
      this.area, 
      this.demonyms,
      this.population, 
      this.flagUri, 
      this.capital 
    }
  );
}

class Currencies{
  List<CurrencyData>? currencies = [];

  Currencies({this.currencies});

  Currencies.fromJson(Map<String, dynamic> j) {
    for(String code in j.keys){
      currencies!.add(
        CurrencyData(
          currencyCode: code,
          currencyName: j[code]["name"],
          currencySymbol: j[code]["symbol"]
        )
      );
    }
  }

  CurrencyData get first{
    return currencies!.first;
  }
}

class CurrencyData{
  String? currencyCode;
  String? currencyName;
  String? currencySymbol;

  CurrencyData({this.currencyCode, this.currencyName, this.currencySymbol});
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

class Demonyms{
  List<DemonymsData>? demonyms = [];

  Demonyms({this.demonyms});

  Demonyms.fromJson(Map<String, dynamic> j){

    for(String gender in j.keys){
      demonyms!.add(
        DemonymsData(
          gender : gender, 
          name : j[gender]
        )
      );
    }
  }

  DemonymsData elementAt(int index){
    return demonyms!.elementAt(index);
  }

}

class DemonymsData{
  String? gender;
  String? name;

  DemonymsData({this.gender, this.name});
}