import 'package:estructura_practica_1/cart/cart_page.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../profile.dart';

class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            new Center(child: new Text("Bebidas", textAlign: TextAlign.center)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartPage(
                        productsList: [
                          ProductItemCart(
                            product: drinksList[0],
                            typeOfProduct: ProductType.BEBIDAS,
                            productTitle: drinksList[0].productTitle,
                            productAmount: 2,
                            productPrice: drinksList[0].productPrice,
                          ),
                          ProductItemCart(
                            product: drinksList[1],
                            typeOfProduct: ProductType.BEBIDAS,
                            productTitle: drinksList[1].productTitle,
                            productAmount: 2,
                            productPrice: drinksList[1].productPrice,
                          ),
                          ProductItemCart(
                            product: drinksList[2],
                            typeOfProduct: ProductType.BEBIDAS,
                            productTitle: drinksList[2].productTitle,
                            productAmount: 2,
                            productPrice: drinksList[2].productPrice,
                          )
                        ],
                      )));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemHotDrinks(
            drink: drinksList[index],
          );
        },
      ),
    );
  }
}
