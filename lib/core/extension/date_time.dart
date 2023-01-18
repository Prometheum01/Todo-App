import 'package:todo_app/product/model/task_date/task_date.dart';

extension DateTimeExt on DateTime {
  TaskDate get toTaskDate => TaskDate(year: year, month: month, day: day);
}
