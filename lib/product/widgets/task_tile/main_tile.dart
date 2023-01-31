import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/decoration.dart';

import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:todo_app/product/widgets/circle_task_type_icon.dart';
import 'package:todo_app/product/widgets/done_or_circle_icon.dart';
import 'package:todo_app/product/widgets/task_card.dart';

import '../../../core/const/padding.dart';
import '../../../core/const/radius.dart';
import '../../model/task/task.dart';
import '../selection_border_button.dart';

class MainTile extends StatelessWidget {
  const MainTile({
    Key? key,
    required this.task,
    this.isSelectionMode = false,
    required this.isDonePage,
  }) : super(key: key);

  final Task task;
  final bool isSelectionMode;
  final bool isDonePage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        InkWell(
          onTap: () {
            context.read<TaskBloc>().add(
                  SelectTask(
                    selectedTask: task,
                  ),
                );
          },
          borderRadius: const RadiusConst.smallAll(),
          splashColor: Color(task.taskType.colorList.first).withOpacity(0.18),
          child: Ink(
            decoration: BoxDecorationConst.whiteRoundedWShadow(),
            child: Padding(
              padding: const PaddingConst.mediumAll(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: CircleTaskTypeIcon(taskType: task.taskType),
                  ),
                  Expanded(
                    flex: 15,
                    child: TaskCardTitle(text: task.title),
                  ),
                  Expanded(
                    flex: 3,
                    child: isSelectionMode
                        ? SelectionBorderButton(task: task)
                        : _DateTime(
                            date: task.date.formatDate,
                            time: task.time.format24,
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const PaddingConst.smallAll(),
          child: Align(
            alignment: Alignment.topLeft,
            child: DoneOrCircleIcon(
              isDone: isDonePage,
              color: Color(
                task.taskType.colorList.first,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DateTime extends StatelessWidget {
  const _DateTime({
    Key? key,
    required this.date,
    required this.time,
  }) : super(key: key);

  final String date, time;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        style: context.textTheme.headlineSmall
            ?.copyWith(fontWeight: FontWeight.w900),
        text: date,
        children: [
          TextSpan(
            text: '\n$time',
            style: context.textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
