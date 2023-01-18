import 'package:flutter/material.dart';
import 'package:todo_app/product/model/task_time/task_time.dart';

extension TimeOfDayExt on TimeOfDay {
  TaskTime get toTaskTime => TaskTime(
      hour: hourOfPeriod, minute: minute, isAm: period == DayPeriod.am);
}
