
import 'package:canary_admin/Dimens.dart';
import 'package:canary_admin/components/CardContentTitle.dart';
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
      child: CardContentTitle(
        title: "Material Dashboard Heading",
        subtitle: "Created using Roboto Font Family",
        content: _BuildContent(context),
      ),
    );
  }

  Widget _BuildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: Dimens.margin_default),
          child: Text(
              "Typography",
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Dimens.margin_default),
          child: _BuildTypes(context),
        )
      ],
    );
  }

  _BuildTypes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildExample("Headline","The Life of Material Dashboard",Theme.of(context).textTheme.headline),
        _buildExample("Title","The Life of Material Dashboard",Theme.of(context).textTheme.title),
        _buildExample("Subtitle","The Life of Material Dashboard",Theme.of(context).textTheme.subtitle),
        _buildExample("Body1","The Life of Material Dashboard",Theme.of(context).textTheme.body1),
        _buildExample("Body2","The Life of Material Dashboard",Theme.of(context).textTheme.body2),
        _buildExample("Subhead","The Life of Material Dashboard",Theme.of(context).textTheme.subhead),
        _buildExample("Overline","The Life of Material Dashboard",Theme.of(context).textTheme.overline),
        _buildExample("Display1","The Life of Material Dashboard",Theme.of(context).textTheme.display1),
        _buildExample("Display2","The Life of Material Dashboard",Theme.of(context).textTheme.display2),
       // _buildExample("Display3","The Life of Material Dashboard",Theme.of(context).textTheme.display3),
       // _buildExample("Display4","The Life of Material Dashboard",Theme.of(context).textTheme.display4),
      ],
    );
  }

  Widget _buildExample(String s, String t, TextStyle theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom:Dimens.margin_default),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150,
              child: Text(s,style: Theme.of(context).textTheme.subhead,)
          ),
          Expanded(
            child: Text(t,style: theme,),
          )
        ],
      ),
    );
  }
}
