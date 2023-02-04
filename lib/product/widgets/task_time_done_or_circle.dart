import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/services/provider/theme_provider.dart';
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
      time.format24,
      textAlign: TextAlign.center,
      style: context.textTheme.headlineSmall?.copyWith(
        color: context.watch<ThemeProvider>().taskTileDOCText,
        fontWeight: isDone ? FontWeight.w900 : FontWeight.w400,
      ),
    );
  }
}
