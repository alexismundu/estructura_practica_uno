import 'package:flutter/material.dart';

import '../models/product_hot_drinks.dart';
import '../utils/constants.dart';

class ItemHotDrinkDetails extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinkDetails({
    Key key,
    @required this.drink,
  }) : super(key: key);
  @override
  _ItemHotDrinkDetailsState createState() => _ItemHotDrinkDetailsState();
}

class _ItemHotDrinkDetailsState extends State<ItemHotDrinkDetails> {
  IconData favoriteIcon = Icons.favorite_border_outlined;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.only(bottom: 24, left: 10, right: 10),
              height: 300,
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
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        DETAILS_IMAGE_BACKGROUND_COLOR_DARKER,
                        DETAILS_IMAGE_BACKGROUND_COLOR_LIGHT
                      ])),
              child: Row(children: [
                SizedBox(
                  width: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    "${widget.drink.productImage}",
                    fit: BoxFit.contain,
                    width: 230,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => {
                          setState(() => {
                                favoriteIcon == Icons.favorite_border_outlined
                                    ? favoriteIcon = Icons.favorite
                                    : favoriteIcon =
                                        Icons.favorite_border_outlined
                              })
                        },
                        child: Icon(
                          favoriteIcon,
                          color: PRIMARY_COLOR,
                        ),
                      )),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
