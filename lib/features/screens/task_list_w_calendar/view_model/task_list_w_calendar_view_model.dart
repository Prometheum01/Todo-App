import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/extension/date_time.dart';
import 'package:todo_app/core/services/bloc/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:todo_app/product/model/task_date/task_date.dart';

import '../view/task_list_w_calendar_view.dart';

abstract class TaskListCalendarViewModel extends State<TaskListCalendarView> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    initCalendar();
    Future.microtask(() => animateListViewToCurrentDate());
  }

  initCalendar() {
    context.read<CalendarCubit>().createCalendar();
    context.read<CalendarCubit>().changeDay(
          taskDate: DateTime.now().toTaskDate,
          context: context,
          selectedIndex: DateTime.now().toTaskDate.day - 1,
        );
  }

  listenDays() {
    double sizeForMid = context.dynamicWidth(0.5 - 0.1) - 8;

    // ignore: no_leading_underscores_for_local_identifiers
    int _initialMonthIndex =
        (context.read<CalendarCubit>().state as CalendarCreated)
            .selectedMonthIndex;

    controller.addListener(() {
      // ignore: no_leading_underscores_for_local_identifiers
      int _selectedMonthIndex =
          (context.read<CalendarCubit>().state as CalendarCreated)
              .selectedMonthIndex;

      int bigDayCount = monthsDayCount[_selectedMonthIndex];

      int smallDayCount = monthsDayCount[_selectedMonthIndex > 0
          ? _selectedMonthIndex - 1
          : _selectedMonthIndex];

      for (int i = _initialMonthIndex;
          i <
              (_initialMonthIndex > _selectedMonthIndex
                  ? _selectedMonthIndex + 12
                  : _selectedMonthIndex);
          i++) {
        bigDayCount += monthsDayCount[i % 12];

        smallDayCount += i !=
                (_initialMonthIndex > _selectedMonthIndex
                    ? _selectedMonthIndex + 12 - 1
                    : _selectedMonthIndex - 1)
            ? monthsDayCount[i % 12]
            : 0;
      }

      double smallBorderOffset = (smallDayCount * context.dynamicWidth(0.2)) +
          (8 * (smallDayCount - 1)) -
          sizeForMid;

      double bigBorderOffset = (bigDayCount * context.dynamicWidth(0.2)) +
          (8 * (bigDayCount - 1)) -
          sizeForMid;

      if (controller.offset >= bigBorderOffset) {
        List<TaskDate> taskDateList =
            (context.read<CalendarCubit>().state as CalendarCreated)
                .taskDateList;
        context.read<CalendarCubit>().changeMonthAndYear(
            selectedMonthIndex: taskDateList[bigDayCount + 1].month - 1,
            selectedYear: taskDateList[bigDayCount + 1].year);
      } else if (controller.offset <= smallBorderOffset) {
        List<TaskDate> taskDateList =
            (context.read<CalendarCubit>().state as CalendarCreated)
                .taskDateList;
        context.read<CalendarCubit>().changeMonthAndYear(
            selectedMonthIndex: taskDateList[smallDayCount - 2].month - 1,
            selectedYear: taskDateList[smallDayCount - 2].year);
      }
    });
  }

  animateListViewToCurrentDate() {
    // ignore: no_leading_underscores_for_local_identifiers
    int _selectedIndex =
        (context.read<CalendarCubit>().state as CalendarCreated).selectedIndex;

    double allBoxSize = (context.dynamicWidth(0.2) * (_selectedIndex));

    double sizeForMid = context.dynamicWidth(0.5 - 0.1) - 8;

    double allPaddingSize = 8 * (_selectedIndex - 1);

    controller.animateTo(
      allBoxSize + allPaddingSize - sizeForMid,
      duration: context.durationLow,
      curve: Curves.linear,
    );

    listenDays();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
