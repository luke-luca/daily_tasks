import 'package:daily_tasks/db/tasks_database.dart';
import 'package:flutter/material.dart';

import '../../../model/tasks.dart';

class TaskName extends StatefulWidget {
  const TaskName({Key? key}) : super(key: key);

  @override
  State<TaskName> createState() => _TaskNameState();
}

class _TaskNameState extends State<TaskName> {
  late Future<List<Task>> futureTask;
  @override
  void initState() {
    super.initState();
    futureTask = fetchTask();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: futureTask,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('Failed to load quote'),
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    snapshot.data!.first.taskName,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Future<List<Task>> fetchTask() {}
}
