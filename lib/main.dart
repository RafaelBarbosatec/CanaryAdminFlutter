import 'package:canary_admin/BaseHome.dart';
import 'package:canary_admin/theme/AppTheme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canary Admin',
      theme: appThemeMain,
      home: BaseHome(),
    );
  }
}
