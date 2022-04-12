import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/tasks.dart';

class HddRepo {
  HddRepo._internal();

  factory HddRepo() {
    return _instance;
  }

  static final HddRepo _instance = HddRepo._internal();

  late SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
  
  Future<List<Task>> getTasks() async {
    String helper = prefs.getString('taskList') ?? '[]';
    List helperList = json.decode(helper);
    List<Task> taskList = List<Task>.from(helperList.map((model)=> Task.fromJson(model)));
    return taskList;
  }

  Future<void> addTask(Task task) async {
    List<Task> taskList = await getTasks();
    taskList.add(task);
    taskList.map((e) => e.toJson());
    prefs.setString('taskList', taskList.toString());
  }

}