
import 'package:canary_admin/components/CardContent.dart';
import 'package:canary_admin/components/CardGraph/SimpleTimeSeriesChart.dart';
import 'package:flutter/material.dart';

class CardGraph extends StatelessWidget {

  final Color color;

  const CardGraph({Key key, this.color = Colors.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardContent(
      color: color,
      header: _buildGraph(),
      content: _buildContent(),
    );
  }

  Widget _buildGraph() {
    return Container(
      height: 150,
      child: SimpleTimeSeriesChart.withSampleData(),
    );
  }

  _buildContent() {
    return Container(
      height: 100,
    );
  }
}