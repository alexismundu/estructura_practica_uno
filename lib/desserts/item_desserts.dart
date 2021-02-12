import 'package:estructura_practica_1/desserts/dessert_details_page.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../utils/constants.dart';
import 'package:estructura_practica_1/drinks/hot_drink_details_page.dart';

class ItemDesserts extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemDesserts({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
  IconData favoriteIcon;
  @override
  Widget build(BuildContext context) {
    favoriteIcon =
        widget.drink.liked ? Icons.favorite : Icons.favorite_border_outlined;
    return GestureDetector(
      onTap: _openHotDrinkDetails,
      child: Container(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      setState(() => {_setFavoriteIcon()})
                    },
                    child: Icon(
                      favoriteIcon,
                      color: PRIMARY_COLOR,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _openHotDrinkDetails() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DessertDetailsPage(drink: widget.drink),
    ));
  }

  void _setFavoriteIcon() {
    for (ProductHotDrinks drink in drinksList) {
      if (widget.drink.productTitle == drink.productTitle) {
        if (drink.liked) {
          favoriteIcon = Icons.favorite_border;
        } else {
          favoriteIcon = Icons.favorite;
        }
        drink.liked = !drink.liked;
      }
    }
  }
}
