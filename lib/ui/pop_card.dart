import 'package:flutter/material.dart';
import 'package:hhm_demo_app/models/country_data.dart';

class PopCard extends StatelessWidget {
  double? elevation;
  double? cardRadius;
  final CountryData? country;
  List<Color>? colors;
  BuildContext? parentContext;

  PopCard (
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
                Icon(Icons.wc),
                Text(
                  "Population Data : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
            Text(
              "Demonym (male) : ${country!.demonyms!.elementAt(1).name}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            Text(
              "Demonym (male) : ${country!.demonyms!.elementAt(0).name}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),                  
            Text(
              "Population : ${country!.population}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
          ]
        )
      )
    );
  }
}