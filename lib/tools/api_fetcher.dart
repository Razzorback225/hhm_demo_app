import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/models/country_data.dart';
import 'package:hhm_demo_app/controls/home_ctrl.dart';
import 'package:http/http.dart' as http;

class APIFetcher {
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

            Currencies _currencies = Currencies.fromJson(country["currencies"]);
            Demonyms _demonyms = Demonyms.fromJson(country["demonyms"]["eng"]);

            countries.add(
              CountryData(
                countryName: country["name"]["common"], 
                currenciesList:  _currencies, 
                countryRegion : country["region"], 
                location : LatLng.fromJson(country["latlng"]),
                area : country["area"]?? 0.0, 
                demonyms : _demonyms,
                population : country["population"], 
                flagUri : country["flags"]["png"], 
                capital : CapitalData(
                  checkEmptyList(List.castFrom(country["capital"]), 0, isReturnStr: true),
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

  dynamic checkEmptyList(List<dynamic> list, int index, {bool isReturnStr = false}) {
    if (list.isNotEmpty) {
      return list[index];
    }
    else{
      if (isReturnStr) {
        return "No data";
      }
      else {
        return 0.0;
      }
    }
  }
}

APIFetcher apiFetcher = APIFetcher();
