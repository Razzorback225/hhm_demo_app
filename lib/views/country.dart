import 'package:flutter/material.dart';
import 'package:hhm_demo_app/models/country_data.dart';

class CountryPage extends StatefulWidget{
  
  CountryData? country;

  CountryPage({Key? key}):super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Country Here"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        children: [
          Card(
            child: Container(
              width: MediaQuery.of(context).,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.white],
                  begin : Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
              child: Column(

              ),
            ),
          )
        ],
      ),
    );
  }
}