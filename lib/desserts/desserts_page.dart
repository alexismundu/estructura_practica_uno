import 'package:estructura_practica_1/cart/cart_page.dart';
import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:estructura_practica_1/login.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

import '../profile.dart';

class DessertsPage extends StatelessWidget {
  DessertsPage({
    Key key,
  }) : super(key: key);

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
        title:
            new Center(child: new Text("Postres", textAlign: TextAlign.center)),
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
        itemCount: dessertsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDesserts(
            dessert: dessertsList[index],
          );
        },
      ),
    );
  }
}
