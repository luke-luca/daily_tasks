import 'package:daily_tasks/db/tasks_database.dart';
import 'package:daily_tasks/model/tasks_model.dart';
import 'package:daily_tasks/styles.dart';
import 'package:flutter/material.dart';
import '../../Timer/timerscreen.dart';

class DashboardTile extends StatefulWidget {
  const DashboardTile({
    Key? key,
    required this.textTaskId,
    required this.editingMode,
    required this.textTaskName,
    required this.textTaskDescription,
    required this.textTaskCategory,
    required this.textTaskMinutes,
    required this.textTaskSeconds,
  }) : super(key: key);

  final bool editingMode;
  final int textTaskId;
  final String textTaskName;
  final String textTaskDescription;
  final String textTaskCategory;
  final String textTaskMinutes;
  final String textTaskSeconds;

  @override
  State<DashboardTile> createState() => _DashboardTileState();
}

class _DashboardTileState extends State<DashboardTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TimerScreen()));
      },
      child: GridTile(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          widget.textTaskName,
                          style: CustomStyles.h2,
                        ),
                        Text(
                          widget.textTaskDescription,
                          style: CustomStyles.h3,
                        ),
                        Text(
                          widget.textTaskCategory,
                          style: CustomStyles.h3,
                        ),
                        Text(
                          widget.textTaskMinutes + ":" + widget.textTaskSeconds,
                          style: CustomStyles.paragraph,
                        ),
                      ],
                    ),
                  ),
                )),
            if (widget.editingMode)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.black87,
                  onPressed: () {
                    _deleteTask(widget.textTaskId);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteTask(int id) async {
    await TasksDatabase.instance.deleteTask(id);
  }
}
