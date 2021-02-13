import 'package:estructura_practica_1/cart/cart_page.dart';
import 'package:estructura_practica_1/grains/item_grain_details.dart';
import 'package:estructura_practica_1/login.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class GrainDetailsPage extends StatelessWidget {
  final ProductGrains grain;
  GrainDetailsPage({
    Key key,
    @required this.grain,
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CartPage()));
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ), // Populate the Drawer in the next step.
        ),
        appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Text(
              grain.productTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w100),
            ),
          )),
        ),
        body: ItemGrainDetails(grain: grain));
  }
}
