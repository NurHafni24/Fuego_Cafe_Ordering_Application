import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:group_project/screens/FirstScreen.dart';
import 'package:group_project/design_utils/constants.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu',
      theme: ThemeData(primaryColor: white, accentColor: yellow, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Montserrat"),
      home: FirstScreen(),
    );
  }
}
