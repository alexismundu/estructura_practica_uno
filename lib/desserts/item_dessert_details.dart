import 'package:estructura_practica_1/cart/cart_page.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ItemDessertDetails extends StatefulWidget {
  final ProductDessert dessert;
  ItemDessertDetails({
    Key key,
    @required this.dessert,
  }) : super(key: key);
  @override
  _ItemDessertDetailsState createState() => _ItemDessertDetailsState();
}

class _ItemDessertDetailsState extends State<ItemDessertDetails> {
  int _selectedIndex = 1;
  final _options = ["Rebanada", "Mini", "Completo"];
  IconData favoriteIcon;

  @override
  Widget build(BuildContext context) {
    favoriteIcon =
        widget.dessert.liked ? Icons.favorite : Icons.favorite_border;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
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
                          "${widget.dessert.productImage}",
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
                  child: Text(widget.dessert.productTitle,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w100)),
                ),
                Container(
                    child: Text(widget.dessert.productDescription,
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
                        "\$${widget.dessert.productPrice}",
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
                widget.dessert.productSize = DessertProductSize.REBANADA;
              } else if (i == 1) {
                widget.dessert.productSize = DessertProductSize.MINI;
              } else {
                widget.dessert.productSize = DessertProductSize.COMPLETO;
              }
              widget.dessert.productPrice =
                  widget.dessert.productPriceCalculator();
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
    for (ProductDessert dessert in dessertsList) {
      if (widget.dessert.productTitle == dessert.productTitle) {
        if (dessert.liked) {
          favoriteIcon = Icons.favorite_border;
        } else {
          favoriteIcon = Icons.favorite;
        }
        dessert.liked = !dessert.liked;
      }
    }
  }

  bool _isDessertInCart() {
    for (ProductItemCart item in cartItems) {
      if (item.typeOfProduct != ProductType.POSTRES) continue;
      if (widget.dessert.productTitle == item.productTitle &&
          widget.dessert.productSize == item.product.productSize) {
        return true;
      }
    }
    return false;
  }

  void _addProductToCart() {
    if (!_isDessertInCart()) {
      cartItems.add(ProductItemCart(
        product: ProductDessert(
            productTitle: widget.dessert.productTitle,
            productDescription: widget.dessert.productDescription,
            productImage: widget.dessert.productImage,
            productSize: widget.dessert.productSize,
            productAmount: widget.dessert.productAmount),
        productAmount: 1,
        productPrice: widget.dessert.productPrice,
        productTitle: widget.dessert.productTitle,
        typeOfProduct: ProductType.POSTRES,
      ));
    }
  }
}
