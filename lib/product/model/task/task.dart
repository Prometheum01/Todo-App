import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

import '../task_type/task_type.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends Equatable {
  @HiveField(0)
  final TaskType taskType;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String time;

  @HiveField(5)
  final bool isDone;

  const Task({
    required this.taskType,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.isDone = false,
  });

  static Task get emptyTask => Task(
        taskType: TaskType.taskList.first,
        title: '',
        description: '',
        date: DateTime.now().toString(),
        time: DateTime.now().toString(),
      );

  Task copyWith({
    TaskType? taskType,
    String? title,
    String? description,
    String? date,
    String? time,
    bool? isDone,
  }) {
    return Task(
      taskType: taskType ?? this.taskType,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> props() => [taskType, title, description, date, time, isDone];
}
