import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fuego_cafe/confirm_order.dart';
import 'package:fuego_cafe/design_utils/constants.dart';
import 'package:fuego_cafe/design_utils/widget_functions.dart';
import 'package:fuego_cafe/screens/FirstScreen.dart';
import 'package:fuego_cafe/table.dart';

class SecondScreen extends StatelessWidget {

  int countItem = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: themeData.textTheme.headline5);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TableApp()),
                          );
                        },
                        child: Icon(IconData(0xe092, fontFamily: 'MaterialIcons', matchTextDirection: true),color: black, size: 35,),
                      ),
                      Text("Menu", style: themeData.textTheme.headline1),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Total()), //Go to Asimah's page
                            );
                          },
                          child: Icon(IconData(0xf37f, fontFamily: 'MaterialIcons', matchTextDirection: true),color: black, size: 35,),
                        ),
                    ],
                  ),
                ),
                addVerticalSpace(10),

                Padding(
                  padding: sidePadding,
                  child: Divider(
                      height: padding,
                      color: grey),
                ),

                //Food and Beverages buttons
                Padding(
                  padding: sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FirstScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFFF59D),
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        ),
                        child: Text(
                          'Food',
                          style: themeData.textTheme.bodyText2,
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFFB300),
                          padding: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
                        ),
                        child: Text(
                          'Beverages',
                          style: themeData.textTheme.bodyText2,
                        ),
                      ),

                    ],
                  ),
                ),
                addVerticalSpace(padding),

                //Menu List
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: sidePadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuFood(image: "americano", name: "Americano (RM10.00)"),
                            MenuFood(image: "frappe", name: "Strawberry Frappe (RM12.00)"),
                          ],
                        ),
                      ),
                      addVerticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuFood(image: "hotchoco", name: "Hot Chocolate (RM7.00)"),
                            MenuFood(image: "latte", name: "Latte (RM9.50)"),
                          ],
                        ),
                      ),
                      addVerticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuFood(image: "orange", name: "Orange Juice (RM6.00)"),
                            MenuFood(image: "oreo", name: "Oreo Milkshake (RM11.90)"),
                          ],
                        ),
                      ),
                      addVerticalSpace(padding),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuFood extends StatelessWidget {
  const MenuFood({required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/$image.jpg',
                  height: 200,
                  width: 200,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withAlpha(0),
                      Colors.black12,
                      Colors.black54,
                    ],
                  ),
                ),
                child: Text(
                  name,
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpace(10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFFFB300),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          ),
          child: Text(
            'Add',
            style: TextStyle(
                color: black, fontSize: 15, fontWeight: FontWeight.w500,height: 1.5),
          ),
        ),
      ],
    );
  }
}

