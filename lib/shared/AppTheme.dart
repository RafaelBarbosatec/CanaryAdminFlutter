import 'package:flutter/material.dart';

ThemeData appThemeMain = ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.orange,
    backgroundColor: Colors.grey[200],
    hoverColor: Colors.grey.withAlpha(30),
    textTheme: textThemeMain,
    brightness: Brightness.light,
    unselectedWidgetColor: Colors.grey[600]);

TextTheme textThemeMain = TextTheme(
  headline6: TextStyle(
    fontFamily: 'Bold',
    fontSize: 18.0,
    color: Colors.grey[700],
  ),
  subtitle1: TextStyle(
    fontFamily: 'Normal',
    fontSize: 15.0,
    color: Colors.grey[700],
    fontWeight: FontWeight.w100,
  ),
  subtitle2: TextStyle(
    fontFamily: 'Light',
    fontSize: 15.0,
    color: Colors.grey[700],
    fontWeight: FontWeight.w100,
  ),
  headline5: TextStyle(fontFamily: 'Normal'),
  overline: TextStyle(fontFamily: 'Normal'),
  bodyText2: TextStyle(fontFamily: 'Normal'),
  bodyText1: TextStyle(fontFamily: 'Italic'),
  button: TextStyle(fontFamily: 'Normal'),
  caption: TextStyle(fontFamily: 'Normal'),
  headline4: TextStyle(fontFamily: 'Normal'),
  headline3: TextStyle(fontFamily: 'Normal'),
  headline2: TextStyle(fontFamily: 'Normal'),
  headline1: TextStyle(fontFamily: 'Normal'),
);
