import 'package:flutter/material.dart';
import 'package:car_rental_application/view/screens/edit_profile/edit_profile.dart';
import 'package:car_rental_application/view/screens/settings/settings.dart';
import 'package:car_rental_application/view/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(
        //appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 255, 255, 255)),
      //),
      home: Settings(),
    );
  }
}

