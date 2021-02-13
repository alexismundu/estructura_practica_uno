import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final ValueChanged<double> onAmountUpdated;
  final ValueChanged<double> onProductDeleted;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.onProductDeleted,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  Icon favoriteIcon;

  @override
  Widget build(BuildContext context) {
    favoriteIcon = _initFavIcon();
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
              widget.product.product.productImage,
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
              _createSizeText(widget.product),
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
                            _setFavIcon();
                          })
                        }),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => {
                          cartItems.remove(widget.product),
                          widget.onProductDeleted(widget.product.productPrice *
                              widget.product.productAmount),
                        }),
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

  Text _createDrinkSizeText(ProductHotDrinks drink) {
    String sizeText = "Tamaño grande";
    if (drink.productSize == ProductSize.CH) {
      sizeText = "Tamaño chico";
    } else if (drink.productSize == ProductSize.M) {
      sizeText = "Tamaño mediano";
    }
    return Text(
      sizeText,
      style: TextStyle(color: Theme.of(context).accentColor, fontSize: 16),
    );
  }

  Text _createGrainWeightText(ProductGrains grains) {
    String sizeText = "Kilo";
    if (grains.productWeight == ProductWeight.CUARTO) {
      sizeText = "Cuarto";
    }
    return Text(
      sizeText,
      style: TextStyle(color: Theme.of(context).accentColor, fontSize: 16),
    );
  }

  Text _createSizeText(ProductItemCart product) {
    if (product.typeOfProduct == ProductType.BEBIDAS) {
      return _createDrinkSizeText(product.product);
    } else if (product.typeOfProduct == ProductType.GRANO) {
      return _createGrainWeightText(product.product);
    } else {
      return Text(
        "N/A",
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 16),
      );
    }
  }

  void _setFavIcon() {
    if (widget.product.typeOfProduct == ProductType.BEBIDAS) {
      for (ProductHotDrinks drink in drinksList) {
        if (widget.product.productTitle == drink.productTitle) {
          if (drink.liked) {
            favoriteIcon = Icon(Icons.favorite_border);
          } else {
            favoriteIcon = Icon(Icons.favorite);
          }
          drink.liked = !drink.liked;
        }
      }
    } else if (widget.product.typeOfProduct == ProductType.GRANO) {
      for (ProductGrains grain in grainsList) {
        if (widget.product.productTitle == grain.productTitle) {
          if (grain.liked) {
            favoriteIcon = Icon(Icons.favorite_border);
          } else {
            favoriteIcon = Icon(Icons.favorite);
          }
          grain.liked = !grain.liked;
        }
      }
    }
  }

  Icon _initFavIcon() {
    if (widget.product.typeOfProduct == ProductType.BEBIDAS) {
      for (ProductHotDrinks drink in drinksList) {
        if (widget.product.productTitle == drink.productTitle) {
          if (drink.liked) {
            return Icon(Icons.favorite);
          } else {
            return Icon(Icons.favorite_border);
          }
        }
      }
    } else if (widget.product.typeOfProduct == ProductType.GRANO) {
      for (ProductGrains grain in grainsList) {
        if (widget.product.productTitle == grain.productTitle) {
          if (grain.liked) {
            return Icon(Icons.favorite);
          } else {
            return Icon(Icons.favorite_border);
          }
        }
      }
    }
    return Icon(Icons.access_alarm);
  }
}
