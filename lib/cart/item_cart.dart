import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  Icon favoriteIcon = Icon(Icons.favorite_border);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            DETAILS_IMAGE_BACKGROUND_COLOR_DARKER,
            DETAILS_IMAGE_BACKGROUND_COLOR_LIGHT
          ])),
      margin: EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.product.productImage,
              width: 90,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${widget.product.productTitle}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Tamaño grande",
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 16),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: _addProd),
                  Text(
                    "${widget.product.productAmount}",
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: _remProd),
                  Text(
                    "\$${widget.product.productPrice}",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: favoriteIcon,
                    onPressed: () => {
                          setState(() {
                            favoriteIcon.icon == Icons.favorite_border
                                ? favoriteIcon = Icon(Icons.favorite)
                                : favoriteIcon = Icon(Icons.favorite_border);
                          })
                        }),
                IconButton(icon: Icon(Icons.delete), onPressed: () => {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }
}
