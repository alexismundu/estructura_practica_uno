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
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Colors.purple[500])),
          fontFamily: 'Montserrat',
          primarySwatch: PRIMARY_COLOR,
          accentColor: SECONDARY_COLOR,
          iconTheme: IconThemeData(color: PRIMARY_COLOR),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            primary: LIST_BACKGROUND_COLOR_DARKER, // background
            onPrimary: SECONDARY_COLOR, // foreground
          ))),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(
              title: APP_TITLE,
            )
      },
    );
  }
}
