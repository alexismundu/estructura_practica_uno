import 'package:estructura_practica_1/desserts/item_dessert_details.dart';
import 'package:estructura_practica_1/grains/item_grain_details.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class DessertDetailsPage extends StatelessWidget {
  final ProductHotDrinks drink;
  DessertDetailsPage({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Text(
              drink.productTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w100),
            ),
          )),
        ),
        body: ItemDessertDetails(drink: drink));
  }
}
