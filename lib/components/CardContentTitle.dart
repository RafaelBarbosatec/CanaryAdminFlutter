import 'package:canary_admin/components/CardContent.dart';
import 'package:flutter/material.dart';

class CardContentTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color textColor;
  final Color color;
  final Widget content;

  const CardContentTitle(
      {Key key,
      this.title = "",
      this.subtitle = "",
      this.content,
      this.textColor = Colors.white, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardContent(
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .merge(TextStyle(color: textColor)))),
          Container(
            margin: EdgeInsets.only(top: 5.0),
              child: Text(subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .merge(TextStyle(color: textColor)))),
        ],
      ),
      content: content,
      color: color == null ? Theme.of(context).primaryColor: color,
    );
  }
}
