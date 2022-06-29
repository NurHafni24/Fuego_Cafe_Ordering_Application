import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ffi';

void main() {
  List <int> MenuList[];
  MenuList.foreach((element){
    print(element);
  });

}

class MenuItem {
  final String id;
  final String image;
  final int price;
  final String name;

  const MenuItem({
    required this.id,
    required this.image,
    required this.price,
    required this.name
});}

int getQuantity(){
  return
}

  List<Map<String, Object>> get totalItemsPrice{
    return List.generate(1, (index) {
      var totalPriceSum = 0.0;
      for (var i = 0; i < menu.length; i++) {
        totalPriceSum = menu[index].amount + totalPriceSum;
      }
      return {
        'Total' : totalSum,
      };
    }).menuList();
  }



class Total extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBAr: AppBar(
        title: Text(

        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Cancel'),
              style: ElevatedButton.styleFrom(
                alignment: Alignment.bottomLeft,
                primary: Colors.red,
                onPrimary: Colors.red,
                padding: EdgeInsets.all(10.0),
              ),

            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Pay'),
              style: ElevatedButton.styleFrom(
                alignment: Alignment.bottomRight,
                primary: Colors.black,
                onPrimary: Colors.black,
                padding: EdgeInsets.all(10.0),
              ),

            ),
          ]
        )
      )
    )
  }
}
