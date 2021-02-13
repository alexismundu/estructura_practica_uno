import 'package:estructura_practica_1/cart/cart_page.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/login.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';

import '../drinks/hot_drinks_page.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: DETAILS_IMAGE_BACKGROUND_COLOR_DARKER),
              accountName: Text(PROFILE_NAME),
              accountEmail: Text(PROFILE_EMAIL),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    PROFILE_PICTURE,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
              title: Text(PROFILE_CART),
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
            ListTile(
              title: Text(PROFILE_WISHES),
              leading: Icon(Icons.favorite_border),
              onTap: () {},
            ),
            ListTile(
              title: Text(PROFILE_HISTORY),
              leading: Icon(Icons.store),
              onTap: () {},
            ),
            ListTile(
              title: Text(PROFILE_SETTINGS),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text("CERRAR SESION"),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("Proximamente")));
            },
            child: ItemHome(
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HotDrinksPage()),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => GrainsPage()),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DessertsPage()),
    );
  }
}
