import 'package:estructura_practica_1/desserts/item_dessert_details.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

class DessertDetailsPage extends StatelessWidget {
  final ProductDessert dessert;
  DessertDetailsPage({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Text(
              dessert.productTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w100),
            ),
          )),
        ),
        body: ItemDessertDetails(dessert: dessert));
  }
}
