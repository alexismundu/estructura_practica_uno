import 'dart:math';
import 'package:flutter/foundation.dart';

enum DessertProductSize { REBANADA, MINI, COMPLETO }

class ProductDessert {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  DessertProductSize productSize; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductDessert({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productSize,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo a la size del producto
    productPrice = productPriceCalculator();
  }
  double productPriceCalculator() {
    if (this.productSize == DessertProductSize.REBANADA)
      return (20 + Random().nextInt(40)).toDouble();
    if (this.productSize == DessertProductSize.MINI)
      return (40 + Random().nextInt(60)).toDouble();
    if (this.productSize == DessertProductSize.COMPLETO)
      return (60 + Random().nextInt(80)).toDouble();
    return 999.0;
  }
}
