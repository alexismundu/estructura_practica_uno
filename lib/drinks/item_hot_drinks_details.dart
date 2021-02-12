import 'package:flutter/material.dart';

import '../models/product_hot_drinks.dart';
import '../utils/constants.dart';

class ItemHotDrinkDetails extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinkDetails({
    Key key,
    @required this.drink,
  }) : super(key: key);
  @override
  _ItemHotDrinkDetailsState createState() => _ItemHotDrinkDetailsState();
}

class _ItemHotDrinkDetailsState extends State<ItemHotDrinkDetails> {
  int _selectedIndex = 1;
  final _options = ["Chico", "Mediano", "Grande"];
  IconData favoriteIcon = Icons.favorite_border_outlined;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
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
                          "${widget.drink.productImage}",
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
                                      favoriteIcon ==
                                              Icons.favorite_border_outlined
                                          ? favoriteIcon = Icons.favorite
                                          : favoriteIcon =
                                              Icons.favorite_border_outlined
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
                  child: Text(widget.drink.productTitle,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w100)),
                ),
                Container(
                    child: Text(widget.drink.productDescription,
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
                        "\$${widget.drink.productPrice}",
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
                onPressed: () => {},
                child: Text("AGREGAR AL CARRITO"),
              ),
              ElevatedButton(
                onPressed: () => {},
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
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 4), child: choiceChip));
    }

    return chips;
  }
}
