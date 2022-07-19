import 'package:flutter/material.dart';
import 'package:hhm_demo_app/tools/dms_convert.dart';
import 'package:hhm_demo_app/models/country_data.dart';

class CountryCard extends StatelessWidget{
  final CountryData country;
  CountryCard(this.country, {Key? key}):super(key: key);

  BuildContext? cont;

  @override
  Widget build(BuildContext context){

    DMSCoordinates dmsLocation = country.location!.convertToDMS();

    return Card(
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
            Row(
              children: const [
                Icon(Icons.pin_drop),
                Text(
                  "Geographical Data : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                child : Image.network(country.flagUri!, width: 80,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              elevation: 0,
            ),
            Text(
              "Latitude : ${dmsLocation.lat/*country.location.latitude*/}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            Text(
              "Longitude : ${dmsLocation.long/*country.location.longitude*/}",
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
            const SizedBox(height: 5,),
            Row(
              children: const [
                Icon(Icons.person),
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
            const SizedBox(height: 5,),
            Text(
              "Demonym (male) : ${country.demonyms!.elementAt(1).name}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            Text(
              "Demonym (male) : ${country.demonyms!.elementAt(0).name}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),                  
            Text(
              "Population : ${country.population}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            const SizedBox(height: 5,),
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
              "Currency : ${country.currenciesList!.first.currencyName}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            //TODO : Fix symbol display issue                  
            Text(
              "Currency Symbol : ${country.currenciesList!.first.currencySymbol}",
              style: const TextStyle(
                fontSize : 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}