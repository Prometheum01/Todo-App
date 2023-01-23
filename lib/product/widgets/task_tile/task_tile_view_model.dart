import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/product/widgets/task_tile/task_tile_view.dart';

import '../../../core/services/bloc/task_bloc/bloc/task_bloc.dart';

abstract class TaskTileViewModel extends State<TaskTile> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
  }

  selectDone() {
    context.read<TaskBloc>().add(DoneTask(taskList: [widget.task]));
  }

  selectRemove() {
    context.read<TaskBloc>().add(DeleteTask(
          task: widget.task,
          isInDoneDb: !widget.isLeftDone,
        ));
  }

  openSelectionMode() {
    context.read<TaskBloc>().emit(TaskSelection(
        selectedTaskList: [widget.task],
        waitingTaskList:
            (context.read<TaskBloc>().state as TaskLoaded).waitingTaskList,
        doneTaskList:
            (context.read<TaskBloc>().state as TaskLoaded).doneTaskList));
  }

  selectUndone() {
    context.read<TaskBloc>().add(UndoneTask(taskList: [widget.task]));
  }
}
