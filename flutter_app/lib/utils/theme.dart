import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.green,
  accentColor: Colors.orange,
  buttonColor: Colors.orange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
    ),
    bodyText2: TextStyle(
      color: Colors.black54,
      fontSize: 14.0,
    ),
    headline1: TextStyle(
      color: Colors.black87,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: Colors.black87,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      color: Colors.black87,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);