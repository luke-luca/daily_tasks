import 'package:daily_tasks/pages/Dashboard/widgets/daily_quote.dart';
import 'package:daily_tasks/pages/Dashboard/widgets/tasks_chart.dart';
import 'package:flutter/material.dart';
import 'widgets/dashboard_stats.dart';
import 'widgets/dashboard_tile.dart';
import 'models/tasks.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool editingMode = false;
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
                      const DashboardStats(),
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
                              const Text(
                                'Your daily tasks',
                                style: TextStyle(fontSize: 24),
                              ),
                              TextButton(
                                onPressed: () => _onTapEdit(context),
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                          SizedBox(
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
