

import 'package:flutter/material.dart';

ThemeData appThemeMain = ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.orange,
    backgroundColor: Colors.grey[200],
    hoverColor: Colors.grey.withAlpha(30),
    textTheme: textThemeMain,
    brightness: Brightness.light,
    unselectedWidgetColor: Colors.grey[600]
);

TextTheme textThemeMain = TextTheme(
  title: TextStyle(
    fontFamily: 'Bold',
    fontSize: 18.0,
      color: Colors.grey[700],
  ),
  subhead: TextStyle(
      fontFamily: 'Light',
      fontSize: 15.0,
      color: Colors.grey[700],
      fontWeight: FontWeight.w100
  ),
  subtitle: TextStyle(
      fontFamily: 'Normal',
      fontSize: 15.0,
      color: Colors.grey[700],
      fontWeight: FontWeight.w100
  ),
  headline: TextStyle(fontFamily: 'Normal'),
  overline: TextStyle(fontFamily: 'Normal'),
  body1: TextStyle(fontFamily: 'Normal'),
  body2: TextStyle(fontFamily: 'Italic'),
  button: TextStyle(fontFamily: 'Normal'),
  caption: TextStyle(fontFamily: 'Normal'),
  display1: TextStyle(fontFamily: 'Normal'),
  display2: TextStyle(fontFamily: 'Normal'),
  display3: TextStyle(fontFamily: 'Normal'),
  display4: TextStyle(fontFamily: 'Normal'),
);