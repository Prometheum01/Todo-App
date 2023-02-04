import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/services/provider/theme_provider.dart';

import '../../core/const/decoration.dart';
import '../../core/const/padding.dart';
import '../model/task/task.dart';
import 'circle_task_type_icon.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecorationConst.whiteRounded(
        context.watch<ThemeProvider>().cardColor,
        context.watch<ThemeProvider>().cardShadowColor,
      ),
      child: Padding(
        padding: const PaddingConst.mediumAll(),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CircleTaskTypeIcon(taskType: task.taskType),
            ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const PaddingConst.smallSymmetricHorizontal(),
                child: TaskCardTitle(text: task.title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCardTitle extends StatelessWidget {
  const TaskCardTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineMedium,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      maxLines: 1,
    );
  }
}
