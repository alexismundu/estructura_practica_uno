import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: ListView.builder(
              itemCount: widget.productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  onAmountUpdated: _priceUpdate,
                  product: widget.productsList[index],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                ),
                Text(
                  "\$$_total MXN",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  "PAGAR",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
