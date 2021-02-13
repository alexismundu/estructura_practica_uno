import 'package:estructura_practica_1/grains/grain_details_page.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  IconData favoriteIcon;
  @override
  Widget build(BuildContext context) {
    favoriteIcon =
        widget.grain.liked ? Icons.favorite : Icons.favorite_border_outlined;
    return GestureDetector(
      onTap: _openGrainDetails,
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
                      "Café de grano",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(widget.grain.productTitle,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Monserrat',
                            color: SECONDARY_COLOR)),
                    Text(
                      "\$${widget.grain.productPrice}",
                      style: TextStyle(fontSize: 34),
                    )
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                "${widget.grain.productImage}",
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

  void _openGrainDetails() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GrainDetailsPage(grain: widget.grain),
    ));
  }

  void _setFavoriteIcon() {
    for (ProductGrains grain in grainsList) {
      if (widget.grain.productTitle == grain.productTitle) {
        if (grain.liked) {
          favoriteIcon = Icons.favorite_border;
        } else {
          favoriteIcon = Icons.favorite;
        }
        grain.liked = !grain.liked;
      }
    }
  }
}
