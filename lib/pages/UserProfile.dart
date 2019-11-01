import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        elevation: 4.0,
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Icon(Icons.train),
        ),
      ),
    );
  }
}
