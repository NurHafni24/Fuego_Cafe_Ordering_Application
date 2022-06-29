import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fuego_cafe/screens/FirstScreen.dart';
import 'package:fuego_cafe/design_utils/constants.dart';

void main() {
  runApp(Menu());
}

class Menu extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width; //Come from dart:ui class
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu',
      theme: ThemeData(primaryColor: white, accentColor: yellow, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Montserrat"),
      home: FirstScreen(),
    );
  }
}
