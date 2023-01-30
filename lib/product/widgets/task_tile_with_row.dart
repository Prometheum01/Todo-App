import 'package:flutter/material.dart';
import 'package:todo_app/product/widgets/task_time_done_or_circle.dart';

import '../model/task/task.dart';
import 'done_or_circle_icon.dart';
import 'task_card.dart';

class TaskTileWithRow extends StatelessWidget {
  const TaskTileWithRow({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: TaskTimeTextDOC(
              isDone: task.isDone,
              time: task.time,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: DoneOrCircleIcon(
              isDone: task.isDone,
              color: Color(task.taskType.colorList.first),
            ),
          ),
        ),
        Expanded(
          flex: 12,
          child: TaskCard(
            task: task,
          ),
        ),
      ],
    );
  }
}
