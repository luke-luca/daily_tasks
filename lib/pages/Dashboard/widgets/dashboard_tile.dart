import 'package:daily_tasks/pages/Dashboard/widgets/taskName.dart';
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TaskName(),
                    ]),
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

  Future<List> getTask() async {
    final query = taskDatabase.readTask(1);
    List<Task> taskList = [];
    await query.then((value) {
      taskList = value as List<Task>;
    });
    print(taskList);
    return taskList;
  }
}
