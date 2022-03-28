import 'package:daily_tasks/widget/daily_quote.dart';
import 'package:flutter/material.dart';
import '../widget/dashboard_stat.dart';
import '../widget/image_holder.dart';
import '../widget/subscriber_chart.dart';
import '../widget/subscriber_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "2008",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2009",
      subscribers: 11000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2010",
      subscribers: 12000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2011",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2012",
      subscribers: 8500000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2013",
      subscribers: 7700000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2014",
      subscribers: 7600000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2015",
      subscribers: 5500000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              children: const <Widget>[
                Text('Dashboard',
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                DashboardStat(),
                ImageHolder(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[DailyQuote()],
            ),
            Row(
              children: [
                SizedBox(
                    height: 200, width: 390, child: SubscriberChart(data: data))
              ],
            ),
            Row(
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}
