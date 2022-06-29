import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;

  const MenuCard({
    Key? key,
    required this.menu,
}) : super(Key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children[]
                )
                Text(
                  Menu.menus[0].name,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white,
                  ),
                ),
                Text(
                  '\$${Menu.menus[0].price}',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

      ]

      )
    )
  }
}