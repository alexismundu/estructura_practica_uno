import 'package:estructura_practica_1/cart/cart_page.dart';
import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

import '../profile.dart';

class GrainsPage extends StatelessWidget {
  GrainsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: new Text("Café de grano", textAlign: TextAlign.center)),
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemGrains(
            grain: grainsList[index],
          );
        },
      ),
    );
  }
}
