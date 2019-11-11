import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final Color color;
  final String description;
  final IconData icon;
  final bool hasCloseOption;

  const NotificationWidget(this.description,
      {Key key, this.color, this.icon, this.hasCloseOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(icon != null ? icon : null),
            Container(
                margin: EdgeInsets.only(left: 16.0),
                child: Text(description,
                    style: Theme.of(context).textTheme.subhead)),
            verifyCloseOption()
          ],
        ),
      ),
    );
  }

  Widget verifyCloseOption() {
    Widget widget;

    if (hasCloseOption) {
      widget = Container(
        child: Icon(Icons.close),
      );
    } else {
      widget = Container();
    }

    return widget;
  }
}
