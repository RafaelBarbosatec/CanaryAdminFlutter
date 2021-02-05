import 'package:canary_admin/components/card_content.dart';
import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

class CACardGraph extends StatelessWidget {
  final Color color;
  final Widget graphWidget;
  final String title;
  final String subTitle;
  final String bottomText;

  const CACardGraph({Key key, this.color = Colors.red, this.graphWidget, this.title, this.subTitle, this.bottomText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CACardContent(
      color: color,
      header: _buildGraph(),
      content: _buildContent(context),
    );
  }

  Widget _buildGraph() {
    return Container(
      height: 150,
      child: graphWidget,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Container(
            margin: EdgeInsets.only(top: Dimens.margin_default),
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 1,
            margin: EdgeInsets.only(top: Dimens.margin_text),
            color: Theme.of(context).highlightColor,
          ),
          Container(
            margin: EdgeInsets.only(top: Dimens.margin_default),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  size: 15,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      bottomText,
                      style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontSize: 13)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
