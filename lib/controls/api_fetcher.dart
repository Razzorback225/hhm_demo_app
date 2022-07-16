import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/models/country_data.dart';
import 'package:hhm_demo_app/models/models.dart';
import 'package:hhm_demo_app/controls/home_ctrl.dart';
import 'package:http/http.dart' as http;

List<String> regions = ["europe", "americas", "asia", "oceania", "africa"];
String baseUrl = "https://restcountries.com/v3.1/region/";
String filters = "?fields=name,currencies,region,languages,latlng,are,demonyms,population,flags,capitalInfo";

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
              /*CurrencyData(
                Map.of(country["currencies"]).keys.first,
                country["currencies"]["name"],
                country["currencies"]["symbol"]
              ), */
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
              Uri.parse(country["flags"]["svg"]), 
              capital : CapitalData(
                country["capital"]?[0]??"not_found",
                LatLng(
                  checkEmptyList(List.castFrom(country["capitalInfo"]["latlng"]),0),                  
                  checkEmptyList(List.castFrom(country["capitalInfo"]["latlng"]),1)                  
                )
              )
            )
          );
        }
      }       
    );
  }

  //print("Country 1 : ${countries[0]}");

  return countries;
}

double checkEmptyList(List<dynamic> list, int index){
  if(list.isNotEmpty){
    return list[index];
  }
  else{
    return 0.0;
  }
}