import 'package:daily_tasks/db/tasks_database.dart';
import 'package:flutter/material.dart';
import '../../../model/tasks_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskDatabase = TasksDatabase.instance;
  final taskNameController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  final taskCategoryController = TextEditingController();
  final taskMinutesController = TextEditingController();
  final taskSecondsController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    taskNameController.dispose();
    taskDescriptionController.dispose();
    taskCategoryController.dispose();
    taskMinutesController.dispose();
    taskSecondsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add new task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: taskNameController,
              decoration: const InputDecoration(labelText: 'Task name')),
          TextField(
              controller: taskDescriptionController,
              decoration: const InputDecoration(labelText: 'Task Description')),
          TextField(
            controller: taskCategoryController,
            decoration: const InputDecoration(labelText: 'Task Category'),
          ),
          TextField(
              controller: taskMinutesController,
              decoration: const InputDecoration(labelText: 'Task Minutes')),
          TextField(
              controller: taskSecondsController,
              decoration: const InputDecoration(labelText: 'Task Seconds')),
        ],
      ),
      actions: [
        ElevatedButton(
          child: const Text('DeleteAll'),
          onPressed: () {
            taskDatabase.deleteAllTasks();
          },
        ),
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: () {
            taskDatabase.createTask(
              Task(
                taskName: taskNameController.text,
                description: taskDescriptionController.text,
                category: taskCategoryController.text,
                minutes: int.parse(taskMinutesController.text),
                seconds: int.parse(taskSecondsController.text),
              ),
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
