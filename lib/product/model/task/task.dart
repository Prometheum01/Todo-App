import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/product/model/task_date/task_date.dart';
import 'package:todo_app/product/model/task_time/task_time.dart';

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
  final TaskDate date;

  @HiveField(4)
  final TaskTime time;

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
        date: TaskDate(
            year: DateTime.now().year,
            month: DateTime.now().month,
            day: DateTime.now().day),
        time: TaskTime(
            hour: DateTime.now().hour % 12,
            minute: DateTime.now().minute,
            isAm: DateTime.now().hour < 12),
      );

  Task copyWith({
    TaskType? taskType,
    String? title,
    String? description,
    TaskDate? date,
    TaskTime? time,
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
