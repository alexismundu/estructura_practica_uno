import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';

// class ItemHotDrinks extends StatefulWidget {
//   final ProductHotDrinks drink;
//   ItemHotDrinks({
//     Key key,
//     @required this.drink,
//   }) : super(key: key);

//   @override
//   _ItemHotDrinksState createState() => _ItemHotDrinksState();
// }

// class _ItemHotDrinksState extends State<ItemHotDrinks> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: Text("${widget.drink.productTitle}"));
//   }
// }

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  IconData favorite_icon = Icons.favorite_border_outlined;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(top: 28, bottom: 24, left: 24, right: 24),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                LIST_BACKGROUND_COLOR_DARKER,
                LIST_BACKGROUND_COLOR_LIGHT
              ])),
      child: Row(
        children: [
          Container(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Café",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(widget.drink.productTitle,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Monserrat',
                          color: SECONDARY_COLOR)),
                  Text(
                    "\$${widget.drink.productPrice}",
                    style: TextStyle(fontSize: 34),
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              "${widget.drink.productImage}",
              fit: BoxFit.contain,
              width: 140,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => {
                    setState(() => {
                          favorite_icon == Icons.favorite_border_outlined
                              ? favorite_icon = Icons.favorite
                              : favorite_icon = Icons.favorite_border_outlined
                        })
                  },
                  child: Icon(
                    favorite_icon,
                    color: PRIMARY_COLOR,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
