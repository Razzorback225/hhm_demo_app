import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/tools/api_fetcher.dart';
import 'package:hhm_demo_app/controls/home_ctrl.dart';
import 'package:hhm_demo_app/models/country_data.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}):super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder<List<CountryData>>(
        future: apiFetcher.getAllCountries(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            //Display circular progress modal
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){

              setMarkers(context);

              return GoogleMap(
                mapType: MapType.normal,
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                markers: markers,
                initialCameraPosition: initCam,
                onMapCreated: (GoogleMapController controller){
                  if(!cController.isCompleted) {
                    cController.complete(controller);
                  }
                },
              );
            }
            else {
              return const Center(child:Text("No data"));
            }
          }
          else {
            return const Center(child: Text("Error"));
          }
        },
      )      
    );
  }
}