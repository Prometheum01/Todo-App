import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/product/model/task_time/task_time.dart';

class TaskTimeTextDOC extends StatelessWidget {
  const TaskTimeTextDOC({
    super.key,
    required this.time,
    required this.isDone,
  });

  final TaskTime time;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${time.format24Hour} : ${time.toTimeOfDay.minute}',
      textAlign: TextAlign.center,
      style: context.textTheme.headlineSmall?.copyWith(
        color: Colors.black.withOpacity(0.8),
        fontWeight: isDone ? FontWeight.w900 : FontWeight.w400,
      ),
    );
  }
}
