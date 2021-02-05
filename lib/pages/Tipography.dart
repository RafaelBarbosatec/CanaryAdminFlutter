import 'package:canary_admin/components/card_content_title.dart';
import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

class Tipography extends StatefulWidget {
  @override
  _TipographyState createState() => _TipographyState();
}

class _TipographyState extends State<Tipography> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: CACardContentTitle(
        title: "Material Dashboard Heading",
        subtitle: "Created using Roboto Font Family",
        content: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: Dimens.margin_default),
          child: Text(
            "Typography",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Dimens.margin_default),
          child: _buildTypes(context),
        )
      ],
    );
  }

  _buildTypes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildExample("Headline2", "The Life of Material Dashboard", Theme.of(context).textTheme.headline2),
        _buildExample("Headline3", "The Life of Material Dashboard", Theme.of(context).textTheme.headline3),
        _buildExample("Headline4", "The Life of Material Dashboard", Theme.of(context).textTheme.headline4),
        _buildExample("Headline5", "The Life of Material Dashboard", Theme.of(context).textTheme.headline5),
        _buildExample("Headline6", "The Life of Material Dashboard", Theme.of(context).textTheme.headline6),
        _buildExample("Subtitle1", "The Life of Material Dashboard", Theme.of(context).textTheme.subtitle1),
        _buildExample("Subtitle2", "The Life of Material Dashboard", Theme.of(context).textTheme.subtitle2),
        _buildExample("BodyText2", "The Life of Material Dashboard", Theme.of(context).textTheme.bodyText2),
        _buildExample("BodyText1", "The Life of Material Dashboard", Theme.of(context).textTheme.bodyText1),
        _buildExample("Overline", "The Life of Material Dashboard", Theme.of(context).textTheme.overline),

        // _buildExample("Display4","The Life of Material Dashboard",Theme.of(context).textTheme.display4),
      ],
    );
  }

  Widget _buildExample(String s, String t, TextStyle theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.margin_default),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 150,
              child: Text(
                s,
                style: Theme.of(context).textTheme.subtitle2,
              )),
          Expanded(
            child: Text(
              t,
              style: theme,
            ),
          )
        ],
      ),
    );
  }
}
