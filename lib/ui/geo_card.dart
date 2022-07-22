import 'package:flutter/material.dart';
import 'package:hhm_demo_app/models/country_data.dart';
import 'package:hhm_demo_app/tools/dms_convert.dart';

class GeoCard extends StatelessWidget {
  double? elevation;
  double? cardRadius;
  final CountryData? country;
  List<Color>? colors;

  GeoCard (
    {
      this.elevation = 0,
      this.cardRadius = 10, 
      required this.country,
      this.colors = const [Colors.yellow, Colors.white], 
      Key? key
    }
  ):super(key: key);

  @override
  Widget build(BuildContext context) {

    DMSCoordinates dmsLocation = country!.location!.convertToDMS();

    return Card (
      elevation: elevation,
      shape: RoundedRectangleBorder (
        borderRadius: BorderRadius.circular(cardRadius!)
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
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
                child : Image.network(
                  country!.flagUri!, 
                  width: 80,
                  loadingBuilder: ((context, child, loadingProgress) {
                    if(loadingProgress == null ){
                      return child;
                    }
                    else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              elevation: 0,
            ),
            Text(
              "Latitude : ${dmsLocation.lat}"/*"${country.location.latitude}°"*/,
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            Text(
              "Longitude : ${dmsLocation.long}"/*"${country.location.longitude}°*/,
              style: const TextStyle(
                fontSize : 18
              ),
            ),                  
            Text(
              "Region : ${country!.countryRegion}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            Text(
              "Capital City : ${country!.capital!.capitalName}",
              style: const TextStyle(
                fontSize : 18
              ),
            ),
            Text(
              "Area : ${country!.area} km²",
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