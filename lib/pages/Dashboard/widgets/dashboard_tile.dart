import 'package:daily_tasks/db/tasks_database.dart';
import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  const DashboardTile({
    Key? key,
    required this.editingMode,
    required this.textTaskName,
    required this.textTaskDescription,
    required this.textTaskCategory,
    required this.textTaskMinutes,
    required this.textTaskSeconds,
  }) : super(key: key);

  final bool editingMode;
  final String textTaskName;
  final String textTaskDescription;
  final String textTaskCategory;
  final String textTaskMinutes;
  final String textTaskSeconds;

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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 20,
                height: 20,
                child: Column(
                  children: [
                    Text(
                      textTaskName,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Text(textTaskDescription),
                    Text(textTaskCategory),
                    Text(textTaskMinutes),
                    Text(textTaskSeconds),
                  ],
                )),
            if (editingMode)
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

  void _delete() {}
}
