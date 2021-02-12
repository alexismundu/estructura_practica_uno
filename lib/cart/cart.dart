import 'package:estructura_practica_1/pay/pay_page.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';

class Cart extends StatefulWidget {
  Cart({
    Key key,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in cartItems) {
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
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  onProductDeleted: _productDelete,
                  onAmountUpdated: _priceUpdate,
                  product: cartItems[index],
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
                onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => PayPage(
                                  title: "Pagos",
                                )),
                      )
                    },
                child: Text(
                  "PAGAR",
                  style: TextStyle(color: Colors.black, fontSize: 24),
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

  void _productDelete(double itemDeleted) {
    setState(() {
      _total -= itemDeleted;
    });
  }
}
