import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/controls/api_fetcher.dart';
import 'package:hhm_demo_app/controls/home_ctrl.dart';
import 'package:hhm_demo_app/models/country_data.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}):super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    ctxt = context;
    return Scaffold(
      body: FutureBuilder<List<CountryData>>(
        future: getAllCountries(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            //Display circular progress modal
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){

              setMarkers();

              return GoogleMap(
                mapType: MapType.normal,
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                markers: markers,
                initialCameraPosition: initCam,
                onMapCreated: (GoogleMapController controller){
                  c_controller.complete(controller);
                },
              );
            }
            else{
              return const Text("No data");
            }
          }
          else{
            return const Center(child: Text("Error"),);
          }
        },
      )      
      /*floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.my_location),
        onPressed: goToUsr,
      ),*/
    );
  }
}