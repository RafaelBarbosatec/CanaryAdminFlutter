import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final Color color;

  const CardContent({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 35.0),
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            elevation: 0.5,
            child: Container(
              height: 160,
//              width: double.maxFinite,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15, top: 25),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: color,
            shadowColor: color,
            child: Container(
//              width: double.maxFinite,
              height: 60,
            ),
          ),
        ),

      ],
    );
  }
}
