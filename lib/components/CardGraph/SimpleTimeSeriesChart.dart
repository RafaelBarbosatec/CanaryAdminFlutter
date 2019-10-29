import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
      new TimeSeriesSales(new DateTime(2017, 10, 15), 30),
      new TimeSeriesSales(new DateTime(2017, 10, 30), 10),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.white,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        patternColorFn: (_, __) => charts.MaterialPalette.white,
        seriesColor: charts.MaterialPalette.white,
        fillColorFn: (_, __) => charts.MaterialPalette.white,
        areaColorFn: (_, __) => charts.MaterialPalette.white,
        outsideLabelStyleAccessorFn:(_, __) => charts.TextStyleSpec(color: charts.MaterialPalette.white),
        insideLabelStyleAccessorFn:(_, __) => charts.TextStyleSpec(color: charts.MaterialPalette.white),
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}