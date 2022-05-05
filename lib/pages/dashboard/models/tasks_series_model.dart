import 'package:charts_flutter/flutter.dart' as charts;

class TasksSeries {
  final String weekDay;
  final int tasksDone;
  final charts.Color barColor;

  TasksSeries({
    required this.weekDay,
    required this.tasksDone,
    required this.barColor,
  });
}
