import 'package:flutter/material.dart';
import 'package:hhm_demo_app/controls/country_ctrl.dart';
import 'package:hhm_demo_app/models/country_data.dart';
import 'package:hhm_demo_app/ui/geo_card.dart';
import 'package:hhm_demo_app/ui/pop_card.dart';
import 'package:hhm_demo_app/ui/fin_card.dart';


class CountryPage extends StatefulWidget{
  
  CountryData? country;

  CountryPage({Key? key}):super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> with SingleTickerProviderStateMixin{
  
  void initState(){
    tabController = TabController(length: numPages, vsync: this);
    super.initState();
  }  
  
  @override
  Widget build(BuildContext context){

    CountryData country = ModalRoute.of(context)!.settings.arguments as CountryData;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          country.countryName!,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body : Padding(
        padding: const EdgeInsets.all(10),
        child: Column (
          children : [
            Container(
              child: TabPageSelector(
                controller: tabController,
                selectedColor: Colors.yellow,
                color: Colors.black 
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: TabBarView (
                controller: tabController,
                children: [
                  GeoCard(country: country),
                  PopCard(country: country),
                  FinCard(country: country),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}