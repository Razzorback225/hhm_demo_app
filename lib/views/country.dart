import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/controls/home_ctrl.dart';
import 'package:hhm_demo_app/models/country_data.dart';
import 'package:hhm_demo_app/models/ui/data_cards.dart';

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
        foregroundColor: Colors.black,
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
          CountryCard(country)
        ],
      ),
    );
  }
}