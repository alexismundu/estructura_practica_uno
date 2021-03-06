import 'package:estructura_practica_1/cart/cart_page.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

import '../models/product_hot_drinks.dart';
import '../utils/constants.dart';

class ItemGrainDetails extends StatefulWidget {
  final ProductGrains grain;
  ItemGrainDetails({
    Key key,
    @required this.grain,
  }) : super(key: key);
  @override
  _ItemGrainDetailsState createState() => _ItemGrainDetailsState();
}

class _ItemGrainDetailsState extends State<ItemGrainDetails> {
  int _selectedIndex = 1;
  final _options = ["Cuarto", "Kilo"];
  IconData favoriteIcon;

  @override
  Widget build(BuildContext context) {
    favoriteIcon =
        widget.grain.liked ? Icons.favorite : Icons.favorite_border_outlined;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 24, left: 20, right: 20),
                    height: 300,
                    decoration: BoxDecoration(
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
                          "${widget.grain.productImage}",
                          fit: BoxFit.contain,
                          width: 210,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () => {
                                setState(() => {
                                      _setFavoriteIcon(),
                                    })
                              },
                              child: Icon(
                                favoriteIcon,
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(widget.grain.productTitle,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w100)),
                ),
                Container(
                    child: Text(widget.grain.productDescription,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w100))),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("TAMAÑOS DISPONIBLES",
                          style: TextStyle(fontSize: 12)),
                      SizedBox(width: 50),
                      Text(
                        "\$${widget.grain.productPrice}",
                        style: TextStyle(fontSize: 34),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                  child: Row(
                    children: _buildChips(),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => {_addProductToCart()},
                child: Text("AGREGAR AL CARRITO"),
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CartPage()),
                  )
                },
                child: Text("COMPRAR AHORA"),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i],
            style: _selectedIndex == i
                ? TextStyle(color: Colors.purple[700])
                : TextStyle(color: Colors.black)),
        selectedColor: Color(0xFF6200EE).withOpacity(.3),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
              if (i == 0) {
                widget.grain.productWeight = ProductWeight.CUARTO;
              } else {
                widget.grain.productWeight = ProductWeight.KILO;
              }
              widget.grain.productPrice = widget.grain.productPriceCalculator();
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 4), child: choiceChip));
    }

    return chips;
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

  bool _isGrainInCart() {
    for (ProductItemCart item in cartItems) {
      if (item.typeOfProduct != ProductType.GRANO) continue;
      if (widget.grain.productTitle == item.productTitle &&
          widget.grain.productWeight == item.product.productWeight) {
        return true;
      }
    }
    return false;
  }

  void _addProductToCart() {
    if (!_isGrainInCart()) {
      cartItems.add(ProductItemCart(
        product: ProductGrains(
            productTitle: widget.grain.productTitle,
            productDescription: widget.grain.productDescription,
            productImage: widget.grain.productImage,
            productWeight: widget.grain.productWeight,
            productAmount: widget.grain.productAmount),
        productAmount: 1,
        productPrice: widget.grain.productPrice,
        productTitle: widget.grain.productTitle,
        typeOfProduct: ProductType.GRANO,
      ));
    }
  }
}
