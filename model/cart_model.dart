import 'package:equatable/equatable.dart';
import 'package:fuego_trial/model/cart_model.dart';

class Cart extends Equatable {
  Cart();

  double get subtotal =>
      menus.fold(0, (total, current) => total+current.price);

  String get subtotalString => subtotal.toStringAsFixed(2);

}


  List<Menu> menus = [
    Menu(
      name: 'Americano #1',
      price: 5.50,
    ),
    Menu(
      name: 'Orange #2',
      price: 4.50,
    ),
    Menu(
      name: 'Nachos #3',
      price: 7.50,
    ),
    Menu(
      name: 'Lasagna #4',
      price: 9.50,
    ),

  ];
  @override
  List<Object?> get props => [];
}