import 'package:fuego_trial/widget/widgets.dart';
import 'package:fuego_trial/model/models.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';

  static Route route() {
    return MaterialPageRoute(name: routeName),
    builder: (context) => OrderScreen(),
  };
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(title: 'Order Detail'),
    body: Padding(
      padding: conts EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: Column(
        children: [
          Row(

          ),
          SizedBox(height: 10),
          SizedBox(height: 400,
          child: ListView.builder(
            itemCount: Menu().menus.lenght,
            itemBuilder: (context, index) {
              return CartMenuCard(menu: Menu().menus[index]),

            }),
          ),

          Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SUBTOTAL', style: Theme.of(context).textTheme.headline5,),
                    Text('\R\M{Cart().subtotalString}', style: Theme.of(context).textTheme.headline5,),
                  ],

                ),
              ],

            ),
            child: Column(
              children: [
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
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  ),
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
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  ),
                ),

              ],

            ),
          ),
        ],
      ),
    ),
  );
}

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
              '\$${menu.price}', style: Theme.of(context).textTheme.headline6,
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