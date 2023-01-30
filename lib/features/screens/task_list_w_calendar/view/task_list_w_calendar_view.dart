import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/services/bloc/calendar_cubit/cubit/calendar_cubit.dart';
import '../view_model/task_list_w_calendar_view_model.dart';

import 'package:todo_app/core/const/padding.dart';

import 'package:todo_app/product/widgets/calendar_day_card.dart';
import 'package:todo_app/product/widgets/widgets.dart';
import '../../../../product/widgets/n_back_button.dart';
import '../../../../product/widgets/n_task_tile_with_row.dart';

class TaskListCalendarView extends StatefulWidget {
  const TaskListCalendarView({super.key});

  @override
  State<TaskListCalendarView> createState() => _TaskListCalendarViewState();
}

class _TaskListCalendarViewState extends TaskListCalendarViewModel {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          if (state is CalendarInitial) {
            return const Center(
              child: LoadingAnimation(),
            );
          } else if (state is CalendarCreated) {
            return Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                title: Text(
                  monthAndYear(
                      state.selectedYear, (state.selectedMonthIndex % 12) + 1),
                  style: context.textTheme.displayMedium,
                ),
                leading: BackIconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const PaddingConst.mediumSymmetricHorizontal(),
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: ListView.separated(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.taskDateList.length,
                        separatorBuilder: (context, index) => const Padding(
                          padding: PaddingConst.xSmallSymmetricHorizontal(),
                        ),
                        itemBuilder: (context, index) => CalendarDayCard(
                          onPressed: () {
                            if (state.selectedIndex != index) {
                              tapCalendarCard(state.taskDateList[index], index);
                            }
                          },
                          isSelected: state.selectedIndex == index,
                          taskDate: state.taskDateList[index],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: FadeTransition(
                        opacity: opacityAnimation,
                        child: ListView.builder(
                          itemCount: state.selectedTaskList.length,
                          itemBuilder: (context, index) => Padding(
                            padding:
                                const PaddingConst.smallSymmetricVertical(),
                            child: TaskTileWithRow(
                              task: state.selectedTaskList[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: ErrorAnimation(),
          );
        },
      ),
    );
  }
}
