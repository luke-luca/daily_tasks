import 'package:daily_tasks/pages/Dashboard/widgets/daily_quote.dart';
import 'package:daily_tasks/pages/Dashboard/widgets/tasks_chart.dart';
import 'package:daily_tasks/pages/Dashboard/models/tasks_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'widgets/dashboard_stats.dart';
import 'widgets/dashboard_tile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool editingMode = false;
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 190,
                  child: Image.asset(
                    'lib/assets/images/human.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Dashboard',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
                        ),
                      ),
                      DashboardStats(),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: DailyQuote(),
                        ),
                      ),
                      TasksChart(
                        data: data,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your daily tasks',
                                style: TextStyle(fontSize: 24),
                              ),
                              TextButton(
                                onPressed: () => _onTapEdit(context),
                                child: Text('Edit'),
                              ),
                            ],
                          ),
                          Container(
                            height: 400,
                            child: GridView.count(
                              scrollDirection: Axis.horizontal,
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              children: [
                                DashboardTile(editingMode: editingMode),
                                DashboardTile(editingMode: editingMode),
                                DashboardTile(editingMode: editingMode),
                                DashboardTile(editingMode: editingMode),
                                DashboardTile(editingMode: editingMode),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapEdit(BuildContext context) {
    setState(() {
      editingMode = !editingMode;
    });
  }
}
