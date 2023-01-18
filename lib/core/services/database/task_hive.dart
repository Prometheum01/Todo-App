import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/product/model/task/task.dart';
import 'package:todo_app/product/model/task_date/task_date.dart';
import 'package:todo_app/product/model/task_time/task_time.dart';
import 'package:todo_app/product/model/task_type/task_type.dart';

const String waitingTaskDbKey = 'waiting_task';

const String doneTaskDbKey = 'done_task';

class TaskHive {
  final String dbKey;

  TaskHive({this.dbKey = waitingTaskDbKey});

  Future<void> initDB() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(TaskDateAdapter());
    Hive.registerAdapter(TaskTimeAdapter());
    Hive.registerAdapter(TaskTypeAdapter());

    await Hive.openBox<Task>(waitingTaskDbKey);
    await Hive.openBox<Task>(doneTaskDbKey);
  }

  Future<bool> addNewTask(Task newTask) async {
    try {
      Box<Task> box = Hive.box<Task>(dbKey);

      if (!box.values.contains(newTask)) {
        await box.add(newTask);
        return true;
      } else {
        //This value already are in the box
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  bool deleteTask(Task task) {
    try {
      Box<Task> box = Hive.box<Task>(dbKey);

      if (box.values.contains(task)) {
        box.deleteAt(box.values.toList().indexOf(task));
        return true;
      } else {
        //This value already are not in the box
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> changeTask(Task changedTask) async {
    try {
      Box<Task> box = Hive.box<Task>(dbKey);

      if (box.values.contains(changedTask)) {
        await box.putAt(box.values.toList().indexOf(changedTask), changedTask);
        return true;
      } else {
        //This value already are not in the box
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  List<Task> get taskList => Hive.box<Task>(dbKey).values.toList();
}
