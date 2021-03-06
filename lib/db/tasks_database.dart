import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/tasks_model.dart';

class TasksDatabase {
  static final TasksDatabase instance = TasksDatabase._init();
  static Database? _database;

  TasksDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const stringType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tableTasks(
        ${TaskFields.id} $idType,
        ${TaskFields.taskName} $stringType,
        ${TaskFields.category} $stringType,
        ${TaskFields.description} $stringType,
        ${TaskFields.minutes} $intType,
        ${TaskFields.seconds} $intType
      )
    ''');
  }

  Future<Task> createTask(Task task) async {
    final db = await instance.database;
    final id = await db.insert(tableTasks, task.toJson());
    return task.copy(id: id);
  }

  Future<Task> readTask(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableTasks,
        columns: TaskFields.values,
        where: '${TaskFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      throw Exception('Task not found');
    }
  }

  Future<List<Task>> readAllTasks() async {
    final db = await instance.database;
    final result = await db.query(tableTasks);
    return result.map((map) => Task.fromJson(map)).toList();
  }

  Future<int> updateTask(Task task) async {
    final db = await instance.database;
    return await db.update(tableTasks, task.toJson(),
        where: '${TaskFields.id} = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await instance.database;
    return await db
        .delete(tableTasks, where: '${TaskFields.id} = ?', whereArgs: [id]);
  }

  Future deleteAllTasks() async {
    final db = await instance.database;
    return await db.delete(tableTasks);
  }

  Future close() async {
    final db = await instance.database;
    return db.close();
  }
}
