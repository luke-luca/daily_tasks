import 'package:daily_tasks/db/tasks_database.dart';
import 'package:daily_tasks/pages/Dashboard/widgets/daily_quote.dart';
import 'package:daily_tasks/pages/Dashboard/widgets/tasks_chart.dart';
import 'package:flutter/material.dart';
import '../../model/tasks.dart';
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
  late Future<List<Task>> tasksList;
  bool editingMode = false;

  @override
  void initState() {
    super.initState();
    tasksList = getTaskList();
  }

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
                          Container(
                            height: 150,
                            child: FutureBuilder<List<Task>>(
                              future: tasksList,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (!snapshot.hasData) {
                                  return const Center(child: Text('błąd'));
                                } else {
                                  return GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      mainAxisExtent: 200,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      return DashboardTile(
                                        editingMode: editingMode,
                                        textTaskName:
                                            snapshot.data?[i].taskName ?? 'b/d',
                                        textTaskCategory:
                                            snapshot.data?[i].category ?? 'b/d',
                                        textTaskDescription:
                                            snapshot.data?[i].description ??
                                                'b/d',
                                        textTaskMinutes: snapshot
                                                .data?[i].minutes
                                                .toString() ??
                                            'b/d',
                                        textTaskSeconds: snapshot
                                                .data?[i].seconds
                                                .toString() ??
                                            'b/d',
                                      );
                                    },
                                  );
                                }
                              },
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

  Future<List<Task>> getTaskList() async {
    List<Task> taskList = await TasksDatabase.instance.readAllTasks();
    return taskList;
  }
}
