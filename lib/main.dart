import 'package:flutter/material.dart';
import 'package:hhm_demo_app/views/home.dart';
import 'package:hhm_demo_app/views/country.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Hour Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "home",
      routes: {
        "home" : (context) => const MainPage(),
        "country" : (context) => CountryPage()
      },
    );
  }
}