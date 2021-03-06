import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../dashboard/models/tasks_series_model.dart';
import 'package:fl_chart/fl_chart.dart';

class TasksChart extends StatelessWidget {
  final List<TasksSeries> data;

  const TasksChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<TasksSeries, String>> series = [
      charts.Series(
          id: 'Tasks',
          data: data,
          domainFn: (TasksSeries series, _) => series.weekDay,
          measureFn: (TasksSeries series, _) => series.tasksDone,
          colorFn: (TasksSeries series, _) => series.barColor)
    ];

    return Container(
      height: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
