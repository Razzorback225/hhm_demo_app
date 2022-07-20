import 'package:flutter/material.dart';
import 'package:hhm_demo_app/models/country_data.dart';

class FinCard extends StatelessWidget {
  double? elevation;
  double? cardRadius;
  final CountryData? country;
  List<Color>? colors;
  BuildContext? parentContext;

  FinCard (
    {
      this.elevation = 0,
      this.cardRadius = 10, 
      required this.country,
      required this.parentContext,
      this.colors = const [Colors.yellow, Colors.white], 
      Key? key
    }
  ):super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card (
      elevation: elevation,
      shape: RoundedRectangleBorder (
        borderRadius: BorderRadius.circular(cardRadius!)
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(parentContext!).size.height / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: colors!,
            begin : Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.savings),
                Text(
                  "Financial Data : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
            Text(
              "Currency : ${country!.currenciesList!.first.currencyName}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            //TODO : Fix symbol display issue                  
            Text(
              "Currency Symbol : ${country!.currenciesList!.first.currencySymbol}",
              style: const TextStyle(
                fontSize : 18,
              ),
            ),
          ]
        )
      )
    );
  }
}