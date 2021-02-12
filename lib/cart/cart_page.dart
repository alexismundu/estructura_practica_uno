import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

import '../profile.dart';

class CartPage extends StatelessWidget {
  final List<ProductItemCart> productsList;
  CartPage({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text("Lista de compras", textAlign: TextAlign.center)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => Profile()),
                );
              },
            ),
          ],
        ),
        body: Cart(productsList: productsList));
  }
}
