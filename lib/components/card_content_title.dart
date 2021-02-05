import 'package:canary_admin/components/card_content.dart';
import 'package:flutter/material.dart';

class CACardContentTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color textColor;
  final Color color;
  final Widget content;

  const CACardContentTitle({
    Key key,
    this.title = "",
    this.subtitle = "",
    this.content,
    this.textColor = Colors.white,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CACardContent(
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: textColor)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: textColor)),
            ),
          ),
        ],
      ),
      content: content,
      color: color == null ? Theme.of(context).primaryColor : color,
    );
  }
}
