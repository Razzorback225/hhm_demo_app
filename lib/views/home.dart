import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hhm_demo_app/controls/home_ctrl.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}):super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: kGooglePlex,
        onMapCreated: (GoogleMapController controller){
          c_controller.complete(controller);
        },
      ),
      /*floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.my_location),
        onPressed: goToUsr,
      ),*/
    );
  }
}