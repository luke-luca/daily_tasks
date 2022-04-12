import 'package:daily_tasks/pages/Dashboard/models/tasks_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

final List<TasksSeries> data = [
  TasksSeries(
      weekDay: 'Mon',
      tasksDone: 10,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  TasksSeries(
      weekDay: 'Tue',
      tasksDone: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  TasksSeries(
      weekDay: 'Wed',
      tasksDone: 30,
      barColor: charts.ColorUtil.fromDartColor(Colors.red)),
  TasksSeries(
      weekDay: 'Thu',
      tasksDone: 40,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow)),
  TasksSeries(
      weekDay: 'Fri',
      tasksDone: 50,
      barColor: charts.ColorUtil.fromDartColor(Colors.orange)),
  TasksSeries(
      weekDay: 'Sat',
      tasksDone: 60,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple)),
  TasksSeries(
      weekDay: 'Sun',
      tasksDone: 70,
      barColor: charts.ColorUtil.fromDartColor(Colors.pink)),
];
