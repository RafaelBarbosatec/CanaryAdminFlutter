

import 'package:flutter/material.dart';

ThemeData appThemeMain = ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.orange,
    backgroundColor: Colors.grey[200],
    splashColor: Colors.blue.withAlpha(50),
    hoverColor: Colors.grey.withAlpha(30),
    textTheme: textThemeMain,
    unselectedWidgetColor: Colors.grey[600]
);

TextTheme textThemeMain = TextTheme(
  title: TextStyle(fontFamily: 'Bold'),
  subhead: TextStyle(fontFamily: 'Normal'),
  subtitle: TextStyle(
      fontFamily: 'Normal',
      fontSize: 20.0,
      color: Colors.grey[700],
      fontWeight: FontWeight.w400
  ),
  headline: TextStyle(fontFamily: 'Normal'),
  overline: TextStyle(fontFamily: 'Normal'),
  body1: TextStyle(fontFamily: 'Normal'),
  body2: TextStyle(fontFamily: 'Normal'),
  button: TextStyle(fontFamily: 'Normal'),
  caption: TextStyle(fontFamily: 'Normal'),
  display1: TextStyle(fontFamily: 'Normal'),
  display2: TextStyle(fontFamily: 'Normal'),
  display3: TextStyle(fontFamily: 'Normal'),
  display4: TextStyle(fontFamily: 'Normal'),
);