import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/const/decoration.dart';
import '../../core/const/padding.dart';
import '../model/task/task.dart';
import 'n_circle_task_type_icon.dart';

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
              child: CircleTaskTypeIcon(taskType: task.taskType),
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
