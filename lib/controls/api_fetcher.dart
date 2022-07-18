import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/models/country_data.dart';
import 'package:hhm_demo_app/models/models.dart';
import 'package:hhm_demo_app/controls/home_ctrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<String> regions = ["europe", "americas", "asia", "oceania", "africa"];
String baseUrl = "https://restcountries.com/v3.1/region/";
String filters = "?fields=name,currencies,capital,region,languages,latlng,area,demonyms,population,flags,capitalInfo";

Future<List<CountryData>>? getAllCountries() async {
  countries = [];
  
  for(String region in regions){
    Uri regionUri = Uri.parse(baseUrl + region + filters);
    await http.get(regionUri).then(
      (response){
        List<Map<String, dynamic>> body = List.castFrom(json.decode(response.body));
        for(Map<String,dynamic> country in body){
          countries.add(
            CountryData(
              country["name"]["common"], 
              getAllCurrencies(country["currencies"]), 
              country["region"], 
              LatLng(
                country["latlng"][0],
                country["latlng"][1]
              ), 
              country["area"]?? 0.0, 
              [
                DemonymsData(
                "f",
                country["demonyms"]["eng"]["f"]
                ),
                DemonymsData(
                "m",
                country["demonyms"]["eng"]["m"]
                ),
              ],
              country["population"], 
              country["flags"]["png"], 
              capital : CapitalData(
                checkEmptyList(List.castFrom(country["capital"]), 0, returnType : String),
                LatLng(
                  checkEmptyList(List.castFrom(country["capitalInfo"]["latlng"]),0),                  
                  checkEmptyList(List.castFrom(country["capitalInfo"]["latlng"]),1)                  
                )
              )
            )
          );
        }
      },
      onError: (error){
        print("Error : $error");
      }       
    );
  }
  return countries;
}

dynamic checkEmptyList(List<dynamic> list, int index, {dynamic returnType}){
  if(list.isNotEmpty){
    return list[index];
  }
  else{
    if(returnType == String){
      return "No data";
    }
    else{
      return 0.0;
    }
  }
}

List<CurrencyData> getAllCurrencies(Map<dynamic,dynamic> currenciesData){
  List<CurrencyData> currencies = [];

  print("Currencies : $currenciesData");
  
  for(String code in currenciesData.keys){
    currencies.add(
      CurrencyData(
        code, 
        currenciesData[code]["name"], 
        currenciesData[code]["symbol"]
      )
    );
  }

  return currencies;
}