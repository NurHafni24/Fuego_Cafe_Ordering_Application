import 'package:flutter/material.dart';
import 'package:fuego_cafe/confirm_order.dart';
import 'package:fuego_cafe/design_utils/constants.dart';
import 'package:fuego_cafe/design_utils/widget_functions.dart';
import 'package:fuego_cafe/screens/SecondScreen.dart';
import 'package:fuego_cafe/table.dart';


class FirstScreen extends StatelessWidget {

  int countItem = 0;

  int counter (int countItem) {
    return countItem += 1;
  }

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
                      //notification on cart icon
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Total()), //Go to Asimah's Page
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
                          primary: Color(0xFFFFB300),
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
                          primary: Color(0xFFFFF59D),
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
                              MenuFood(image: "nachos", name: "Nachos (RM8.00)"),
                              MenuFood(image: "spaghetti", name: "Spaghetti (RM12.00)"),
                          ],
                        ),
                      ),
                      addVerticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuFood(image: "lasagna", name: "Lasagna (RM12.00)"),
                            MenuFood(image: "chickenchop", name: "Chicken Chop (RM12.00)"),
                          ],
                        ),
                      ),
                      addVerticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuFood(image: "cheese", name: "Cheese Cake (RM17.00)"),
                            MenuFood(image: "choc", name: "Chocolate Cake (RM15.00)"),
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

int counter (int countItem) {
  int countItem = 0;
  return countItem += 1;
}

class MenuFood extends StatelessWidget {
  const MenuFood({required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {

    int countItem = 0;

    int counter (int countItem) {
      return countItem += 1;
    }

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
          onPressed: () => counter(countItem),
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
