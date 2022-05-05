const String tableTasks = 'Tasks';

class TaskFields {
  static final List<String> values = [
    id,
    taskName,
    category,
    minutes,
    seconds,
    description
  ];

  static const String id = '_id';
  static const String taskName = 'taskName';
  static const String category = 'category';
  static const String minutes = 'minutes';
  static const String seconds = 'seconds';
  static const String description = 'description';
}

class Task {
  final int? id;
  final String taskName;
  final String category;
  final int minutes;
  final int seconds;
  final String description;

  const Task({
    this.id,
    required this.taskName,
    required this.category,
    required this.minutes,
    required this.seconds,
    required this.description,
  });

  Task copy({
    int? id,
    String? taskName,
    String? category,
    int? minutes,
    int? seconds,
    String? description,
  }) =>
      Task(
          id: id ?? this.id,
          taskName: taskName ?? this.taskName,
          category: category ?? this.category,
          minutes: minutes ?? this.minutes,
          seconds: seconds ?? this.seconds,
          description: description ?? this.description);

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int?,
        taskName: json[TaskFields.taskName] as String,
        category: json[TaskFields.category] as String,
        minutes: json[TaskFields.minutes] as int,
        seconds: json[TaskFields.seconds] as int,
        description: json[TaskFields.description] as String,
      );

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.taskName: taskName,
        TaskFields.category: category,
        TaskFields.minutes: minutes,
        TaskFields.seconds: seconds,
        TaskFields.description: description,
      };
}
