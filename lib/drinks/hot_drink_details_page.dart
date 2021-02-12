import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import 'item_hot_drinks_details.dart';

class HotDrinkDetailsPage extends StatelessWidget {
  final ProductHotDrinks drink;
  HotDrinkDetailsPage({
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
        body: ItemHotDrinkDetails(drink: drink));
  }
}
