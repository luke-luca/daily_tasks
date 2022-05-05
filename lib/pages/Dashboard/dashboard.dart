import 'package:daily_tasks/db/tasks_database.dart';
import 'package:daily_tasks/pages/Dashboard/widgets/daily_quote.dart';
import 'package:daily_tasks/styles.dart';
import 'package:flutter/material.dart';
import '../../model/tasks_model.dart';
import '../dashboard/widgets/tasks_flcharts.dart';
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
  late Future<List<Task>> tasksList;
  late Task task;
  bool isLoading = false;
  bool editingMode = false;

  @override
  void initState() {
    super.initState();
    tasksList = _getTaskList();
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
                    'lib/assets/images/Humaaan.png',
                    fit: BoxFit.fitWidth,
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
                      Text(
                        'Dashboard',
                        textAlign: TextAlign.left,
                        style: CustomStyles.h1,
                      ),
                      const DashboardStats(),
                      const Padding(
                        padding: EdgeInsets.only(top: 60.0, bottom: 20.00),
                        child: Center(
                          child: DailyQuote(),
                        ),
                      ),
                      BarChartBuider(),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your daily tasks',
                                style: CustomStyles.h3,
                              ),
                              TextButton(
                                onPressed: () => _onTapEdit(context),
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                          Container(
                            height: 120,
                            child: Align(
                              alignment: Alignment.center,
                              child: FutureBuilder<List<Task>>(
                                future: tasksList,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (!snapshot.hasData) {
                                    return const Center(child: Text('Error'));
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
                                              snapshot.data?[i].taskName ??
                                                  'b/d',
                                          textTaskCategory:
                                              snapshot.data?[i].category ??
                                                  'b/d',
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

  Future<List<Task>> _getTaskList() async {
    List<Task> taskList = await TasksDatabase.instance.readAllTasks();
    return taskList;
  }
}
