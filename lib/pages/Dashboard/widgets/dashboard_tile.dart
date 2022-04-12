import 'package:daily_tasks/db/prefs.dart';
import 'package:flutter/material.dart';
import '../../../db/tasks_database.dart';
import '../../../model/tasks.dart';

class DashboardTile extends StatefulWidget {
  const DashboardTile({
    Key? key,
    required this.editingMode,
  }) : super(key: key);

  final bool editingMode;

  @override
  State<DashboardTile> createState() => _DashboardTileState();
}

class _DashboardTileState extends State<DashboardTile> {
  final taskDatabase = TasksDatabase.instance;
  late Future<Task> task;

  @override
  void initState() {
    super.initState();
    task = getTask();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              width: 150,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<Task>(
                  future: task,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (!snapshot.hasData) {
                      return const Text('Błąd');
                    } else {
                      return Text(snapshot.data?.taskName ?? 'xD');
                    }
                  },
                ),
              ),
            ),
            if (widget.editingMode)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.black87,
                  onPressed: _delete,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _delete() {
    // ...
  }

  Future<Task> getTask() async {
    // Task taskList = await taskDatabase.readTask(1);
    Task task = (await HddRepo().getTasks()).first;
    print(task);
    return task;
  }
}
