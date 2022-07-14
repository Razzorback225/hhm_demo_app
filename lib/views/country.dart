import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget{
  
  Map<String, dynamic> country;

  CountryPage(this.country, {Key? key}):super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(

    );
  }
}