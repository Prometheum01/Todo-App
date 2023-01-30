import 'package:flutter/material.dart';

import '../../product/model/task/task.dart';

extension ListSortExtension on List<Task> {
  List<Task> get sortTaskList {
    sort(
      (a, b) {
        if (a.date.year == b.date.year) {
          if (a.date.month == b.date.month) {
            if (a.date.day == b.date.day) {
              //Time
              TimeOfDay timeOfDayA = a.time.toTimeOfDay;
              TimeOfDay timeOfDayB = b.time.toTimeOfDay;

              if (timeOfDayA.hour == timeOfDayB.hour) {
                if (timeOfDayA.minute == timeOfDayB.minute) {
                  return a.title.compareTo(b.title);
                }
                return timeOfDayA.minute.compareTo(timeOfDayB.minute);
              }

              return timeOfDayA.hour.compareTo(timeOfDayB.hour);
            }
            return a.date.day.compareTo(b.date.day);
          }
          return a.date.month.compareTo(b.date.month);
        }
        return a.date.year.compareTo(b.date.year);
      },
    );
    return this;
  }
}
