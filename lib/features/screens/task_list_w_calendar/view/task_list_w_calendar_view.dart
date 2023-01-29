import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/color.dart';
import 'package:todo_app/core/const/image.dart';
import 'package:todo_app/core/const/padding.dart';
import 'package:todo_app/core/const/radius.dart';
import 'package:todo_app/core/services/bloc/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:todo_app/product/model/task_date/task_date.dart';
import 'package:todo_app/product/widgets/widgets.dart';

import '../../../../core/const/decoration.dart';
import '../../../../product/model/task/task.dart';
import '../view_model/task_list_w_calendar_view_model.dart';

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
                title: Text(
                  '${state.selectedMonthIndex % 12} ',
                  style: context.textTheme.displayMedium,
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
                            padding: PaddingConst.xSmallSymmetricHorizontal()),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            context.read<CalendarCubit>().changeDay(
                                taskDate: state.taskDateList[index],
                                context: context,
                                selectedIndex: index);
                          },
                          child: CalendarDecoration(
                            selectedIndex: state.selectedIndex,
                            days: state.taskDateList,
                            index: index,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: ListView.separated(
                        itemCount: state.selectedTaskList.length,
                        separatorBuilder: (context, index) => const Padding(
                            padding: PaddingConst.smallSymmetricVertical()),
                        itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: TaskTimeDOC(
                                      task: state.selectedTaskList[index]),
                                )),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: DoneOrTickIcon(
                                  isDone: state.selectedTaskList[index].isDone,
                                  color: Color(state.selectedTaskList[index]
                                      .taskType.colorList.first),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: TaskCard(
                                task: state.selectedTaskList[index],
                              ),
                            ),
                          ],
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

class TaskTimeDOC extends StatelessWidget {
  const TaskTimeDOC({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${task.time.format24Hour} : ${task.time.toTimeOfDay.minute}',
      textAlign: TextAlign.center,
      style: context.textTheme.headlineSmall?.copyWith(
        color: Colors.black.withOpacity(0.8),
        fontWeight: task.isDone ? FontWeight.w900 : FontWeight.w400,
      ),
    );
  }
}

class DoneOrTickIcon extends StatelessWidget {
  const DoneOrTickIcon({
    super.key,
    required this.isDone,
    this.color,
  });

  final bool isDone;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isDone ? ImageConst.doneTickIconPath : ImageConst.circleIconPath,
      color: color,
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecorationConst.whiteRounded(),
      child: Padding(
        padding: const PaddingConst.mediumAll(),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(
                        task.taskType.colorList.first,
                      ),
                      Color(
                        task.taskType.colorList.last,
                      ),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const PaddingConst.mediumAll(),
                  child: SvgPicture.asset(
                    task.taskType.iconPath,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const PaddingConst.smallSymmetricHorizontal(),
                child: Text(
                  task.title,
                  style: context.textTheme.headlineMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarDecoration extends StatelessWidget {
  const CalendarDecoration({
    Key? key,
    required this.selectedIndex,
    required this.days,
    required this.index,
  }) : super(key: key);

  final int selectedIndex;
  final int index;
  final List<TaskDate> days;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: context.dynamicWidth(0.2),
      decoration: BoxDecoration(
        borderRadius: const RadiusConst.smallAll(),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: selectedIndex != index
              ? const [
                  Colors.transparent,
                  Colors.transparent,
                ]
              : const [
                  Color(ColorConst.palatinateBlue),
                  Color(ColorConst.aqua),
                ],
        ),
      ),
      child: Padding(
        padding: const PaddingConst.xLargeSymmetricHorizontal(),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: days[index].day.toString(),
              style: context.textTheme.displayMedium?.copyWith(
                  color: selectedIndex != index ? Colors.black : Colors.white),
              children: [
                TextSpan(
                  text: '\n${days[index].textDay}',
                  style: context.textTheme.displayMedium?.copyWith(
                      color:
                          selectedIndex != index ? Colors.black : Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
