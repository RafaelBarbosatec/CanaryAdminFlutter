import 'package:canary_admin/components/CardContentTitle.dart';
import 'package:canary_admin/components/NotificationWidget.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return CardContentTitle(
      title: "Notification",
      subtitle:
          "Handcrafted by our friend Robert McIntosh. Please checkout the full documentation.",
      content: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text("Notification Style"),
//            NotificationWidget("This is a plain notification",
//                color: Theme.of(context).primaryColor),
          ],
        ),
        Column(
          children: <Widget>[
            Text("Notification States"),
//            NotificationWidget(
//                "INFO - This is a regular notification made with \".alert-info\"",
//                color: Theme.of(context).primaryColor,
//                hasCloseOption: true),
          ],
        )
      ],
    );
  }
}
