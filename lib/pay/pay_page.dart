import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/profile.dart';

class PayPage extends StatefulWidget {
  final String title;
  PayPage({Key key, this.title}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
              onTap: _showMaterialDialog,
              child: _createPayItem(Icons.credit_card, "Tarjeta de crédito")),
          GestureDetector(
            onTap: _showMaterialDialog,
            child: _createPayItem(Icons.payment_outlined, "PayPal"),
          ),
          GestureDetector(
              onTap: _showMaterialDialog,
              child: _createPayItem(Icons.card_giftcard, "Tarjeta de regalo")),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("Proximamente")));
            },
          ),
        ],
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              titlePadding: EdgeInsets.all(0),
              title: Image.network(
                  "https://ep01.epimg.net/elcomidista/imagenes/2017/09/27/articulo/1506522721_155894_1506523041_media_normal.jpg"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Orden exitosa!"),
                  Text(
                      "Tu orden ha sido registrada, para más informaición busca en la opción historial de compras en tu perfil.")
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('ACEPTAR'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  _createPayItem(IconData icon, String title) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 24, left: 20, right: 20, top: 30),
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
              LIST_BACKGROUND_COLOR_DARKER,
              LIST_BACKGROUND_COLOR_LIGHT
            ])),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Icon(
              icon,
              size: 60,
            ),
          ),
          Container(
            width: 150,
            child: Text(
              title,
              style:
                  TextStyle(fontSize: 28, color: Theme.of(context).accentColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.edit,
                size: 34,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
