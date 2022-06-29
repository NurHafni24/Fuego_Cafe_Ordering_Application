import'package:flutter/material.dart';
import 'package:fuego_trial/model/cart_model.dart';

class cartMenuCard extends StatelessWidget {
  final Menu menu;

  const CartMenuCard({Key? key, required this.menu}) : super(Key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(menu.imageUrl,
            width: 100, height: 80, fit: BoxFit.cover,),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.name, style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '\R\M{Cart().subtotalString}', style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          Row(children: [
            IconButton(icon: Icon(Icons.remove_circle), onPressed: () {}),
            Text('1', style: Theme.of(context).textTheme.headline5,),
            IconButton(icon: Icon(Icons.add_circle), onPressed: () {}),
          ],),
        ],),
    );
  }
}