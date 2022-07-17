import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/controls/home_ctrl.dart';
import 'package:hhm_demo_app/models/country_data.dart';
import 'package:latlong/latlong.dart';

class CountryPage extends StatefulWidget{
  
  CountryData? country;

  CountryPage({Key? key}):super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage>{
  @override
  Widget build(BuildContext context){

    CountryData country = ModalRoute.of(context)!.settings.arguments as CountryData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.countryName,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Colors.yellow, Colors.white],
                  begin : Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Geographical Data: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      child : Image.network(country.flagsUri, width: 80,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    elevation: 0,
                  ),
                  Text(
                    "Latitude : ${country.location.latitude}",
                    style: const TextStyle(
                      fontSize : 18
                    ),
                  ),
                  Text(
                    "Longitude : ${country.location.longitude}",
                    style: const TextStyle(
                      fontSize : 18
                    ),
                  ),                  
                  Text(
                    "Region : ${country.countryRegion}",
                    style: const TextStyle(
                      fontSize : 18
                    ),
                  ),
                  Text(
                    "Capital City : ${country.capital?.capitalName?? "No data"}",
                    style: const TextStyle(
                      fontSize : 18
                    ),
                  ),
                  Text(
                    "Area : ${country.area} km²",
                    style: const TextStyle(
                      fontSize : 18
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}