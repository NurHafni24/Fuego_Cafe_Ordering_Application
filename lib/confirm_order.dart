import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fuego_cafe/payment.dart';
import 'package:fuego_cafe/table.dart';
// import 'dart:ffi';


class MenuItem {
  final String id;
  final String image;
  final int price;
  final String name;

  const MenuItem(
      {required this.id,
      required this.image,
      required this.price,
      required this.name});
}

// int getQuantity(){
//   return
// }

//make price list at menu page and pass it to this page
//calculate price for that list

// List<Map<String, Object>> get totalItemsPrice {
//   return List.generate(1, (index) {
//     var totalPriceSum = 0.0;
//     for (var i = 0; i < menu.length; i++) {
//       totalPriceSum = menu[index].amount + totalPriceSum;
//     }
//     return {
//       'Total': totalPriceSum,
//     };
//   }).menuList();
// }

// double totalPriceSum(int menuListId) {
//   return ItemsPrice.where((item) => item.menuListId == menuListId)
//       .fold(0.0, (sum, item) => sum + item['Total']);
// }

var sum = 0;
// var price = [1, 2, 3];

class Total extends StatelessWidget {


mainTotal() {
  // int sum = 0;
  // int price = [1, 2, 3];
var price = [1, 2, 3];

  for (int i = 0; i < 3; i++) {
    sum += price[i];
  }
  // Total(sum);
  // Total();
  // print("Sum : ${sum}");
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        appBar: AppBar(
          title: const Text('Confirm Order'),
          centerTitle: true,
          backgroundColor: Color(0xFFEEEEEE),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
              sum,
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TableApp()),
                  );
                },
                child: const Text('Cancel'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 241, 132, 7),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                ),
              ),
              const SizedBox(
                //To have space between 'Pay' button and 'Total paid'
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyPayment()), //Pass variable total
                  );
                },
                child: const Text('Pay'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 241, 132, 7),
                  padding: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
                ),
              ),
            ])));
  }
}
