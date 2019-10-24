import 'package:canary_admin/BaseHome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canary Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            title: TextStyle(fontFamily: 'Bold'),
            subtitle: TextStyle(fontFamily: 'Normal'),
            body1: TextStyle(fontFamily: 'Normal'),
            body2: TextStyle(fontFamily: 'Normal')
        )
      ),
      home: BaseHome(),
    );
  }
}
