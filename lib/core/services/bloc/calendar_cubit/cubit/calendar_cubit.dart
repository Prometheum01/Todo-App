import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/product/model/task/task.dart';

import '../../../../../product/model/task_date/task_date.dart';
import '../../task_bloc/bloc/task_bloc.dart';

part 'calendar_state.dart';

const List<int> monthsDayCount = [
  31,
  28,
  31,
  30,
  31,
  30,
  31,
  31,
  30,
  31,
  30,
  31,
];

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());

  createCalendar() {
    if (state is CalendarInitial) {
      List<TaskDate> taskDateList = [];

      int currentMonthIndex = DateTime.now().month - 1;

      int currentYear = DateTime.now().year;

      for (int m = currentMonthIndex; m < (12 + currentMonthIndex); m++,) {
        for (int d = 0;
            d <
                (((m > 12
                            ? ((currentYear + 1) % 4 == 0)
                            : (currentYear % 4 == 0)) &&
                        (m % 12) == 1)
                    ? (monthsDayCount[m % 12] + 1)
                    : monthsDayCount[m % 12]);
            d++,) {
          taskDateList.add(
            TaskDate(
              year: (m > 12 ? currentYear + 1 : currentYear),
              month: (m % 12) + 1,
              day: d + 1,
            ),
          );
        }
      }

      emit(
        CalendarCreated(
          selectedIndex: DateTime.now().day - 1,
          selectedMonthIndex: currentMonthIndex,
          selectedYear: currentYear,
          selectedTaskList: const [],
          taskDateList: taskDateList,
        ),
      );
    }
  }

  changeDay(
      {required TaskDate taskDate,
      required int selectedIndex,
      required BuildContext context}) {
    if (state is CalendarCreated) {
      final state = this.state as CalendarCreated;
      List<Task> taskList = [];

      TaskState taskState = context.read<TaskBloc>().state;

      if (taskState is TaskLoaded) {
        for (Task task in taskState.waitingTaskList) {
          if (task.date == taskDate) {
            taskList.add(task);
          }
        }
        for (Task task in taskState.doneTaskList) {
          if (task.date == taskDate) {
            taskList.add(task);
          }
        }
      }

      taskList.sort(
        (a, b) {
          TimeOfDay timeOfDayA = a.time.toTimeOfDay;
          TimeOfDay timeOfDayB = b.time.toTimeOfDay;
          if (timeOfDayA.hour == timeOfDayB.hour) {
            if (timeOfDayA.minute == timeOfDayB.minute) {
              return a.title.compareTo(b.title);
            }
            return timeOfDayA.minute.compareTo(timeOfDayB.minute);
          }

          return timeOfDayA.hour.compareTo(timeOfDayB.hour);
        },
      );

      emit(state.copyWith(
        selectedTaskList: taskList,
        selectedIndex: selectedIndex,
        selectedMonthIndex: taskDate.month - 1,
        selectedYear: taskDate.year,
      ));
    }
  }

  changeMonthAndYear(
      {required int selectedMonthIndex, required int selectedYear}) {
    if (state is CalendarCreated) {
      final state = this.state as CalendarCreated;

      emit(state.copyWith(
          selectedMonthIndex: selectedMonthIndex, selectedYear: selectedYear));
    }
  }
}
