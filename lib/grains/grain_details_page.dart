import 'package:estructura_practica_1/grains/item_grain_details.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
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
