import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: PRIMARY_COLOR,
      ),
      initialRoute: '/',
      routes: {'/': (context) => Home(title: APP_TITLE)},
    );
  }
}
