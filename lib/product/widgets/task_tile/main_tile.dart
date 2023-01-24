import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/decoration.dart';

import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';

import '../../../core/const/padding.dart';
import '../../../core/const/radius.dart';
import '../../model/task/task.dart';

import '../widgets.dart';

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
      children: [
        InkWell(
          onTap: () {
            context.read<TaskBloc>().add(SelectTask(selectedTask: task));
          },
          borderRadius: const RadiusConst.smallAll(),
          splashColor: Color(task.taskType.colorList.first).withOpacity(0.18),
          child: Ink(
            height: context.dynamicHeight(0.1),
            decoration: BoxDecorationConst.whiteRoundedWShadow(),
            child: Padding(
              padding: const PaddingConst.smallSymmetricHorizontal(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: TaskTypeCircle(
                      type: task.taskType,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: context.textTheme.headline3,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: isSelectionMode
                        ? SelectionBorderButton(task: task)
                        : _DateTime(
                            date: task.date.formatDate,
                            time: task.time.formatTime,
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const PaddingConst.xSmallSymmetricHorizontal() +
              const PaddingConst.smallSymmetricVertical(),
          child: DoneOrCircleIcon(
            isDonePage: isDonePage,
            colorList: [
              Color(task.taskType.colorList.first),
              Color(task.taskType.colorList.last),
            ],
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
        style:
            context.textTheme.headline4?.copyWith(fontWeight: FontWeight.w900),
        text: date,
        children: [
          TextSpan(
            text: '\n$time',
            style: context.textTheme.headline6,
          )
        ],
      ),
    );
  }
}
