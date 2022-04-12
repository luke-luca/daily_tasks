import 'package:flutter/material.dart';
import '../db/tasks_database.dart';
import '../model/tasks.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
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
          TextField(controller: taskNameController),
          TextField(controller: taskDescriptionController),
          TextField(controller: taskCategoryController),
          TextField(controller: taskMinutesController),
          TextField(controller: taskSecondsController),
        ],
      ),
      actions: [
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: () {
            addTask();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Future addTask() async {
    final task = Task(
      taskName: taskNameController.text,
      category: taskCategoryController.text,
      description: taskDescriptionController.text,
      minutes: 0,
      seconds: 0,
    );

    await TasksDatabase.instance.create(task);
    print(taskNameController.text);
    print(taskCategoryController.text);
    print(taskDescriptionController.text);
  }
}
