import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/bloc/task_bloc/bloc/task_bloc.dart';
import '../view/done_task_view.dart';

abstract class DoneTaskViewModel extends State<DoneTaskView> {
  void closePage() {
    Navigator.of(context).pop();
  }

  void closeSelectionMode() {
    context.read<TaskBloc>().add(LoadTask());
  }

  void addAllUndone() {
    context.read<TaskBloc>().add(
          UndoneTask(
            taskList: (context.read<TaskBloc>().state as TaskSelection)
                .selectedTaskList,
          ),
        );
  }

  void removeAll() {
    context.read<TaskBloc>().add(
          DeleteTaskList(
              taskList: (context.read<TaskBloc>().state as TaskSelection)
                  .selectedTaskList,
              isInDoneDb: true),
        );
  }
}
