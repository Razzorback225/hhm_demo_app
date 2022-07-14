import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/models/country_data.dart';
import 'package:hhm_demo_app/models/models.dart';
import 'package:http/http.dart' as http;

List<String> regions = ["europe", "americas", "asia", "oceania", "africa"];
String baseUrl = "https://restcountries.com/v3.1/region/";
String filters = "?fields=name,currencies,region,languages,latlng,are,demonyms,population,flags,capitalInfo";

Future<List<CountryData>> getAllCountries() async {
  List<CountryData> cData = List.empty(growable: true);
  regions.forEach(
    (region) async { 
      Uri regionUri = Uri.parse(baseUrl + region + filters);
      var response = await http.get(regionUri);
      List<Map<String, dynamic>> body = List.castFrom(json.decode(response.body));
      print(body[0].toString());
      body.forEach(
        (country) {
          print("${country["name"]["common"]} : ${country["capitalInfo"]["latlng"]}"); 
          cData.add(
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
      );
    }
  );

  return cData;
}

double checkEmptyList(List<dynamic> list, int index){
  if(list.isNotEmpty){
    return list[index];
  }
  else{
    return 0.0;
  }
}