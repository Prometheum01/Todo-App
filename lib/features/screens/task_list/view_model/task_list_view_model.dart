import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';
import 'package:todo_app/features/screens/done_task/view/done_task_view.dart';

import '../../../../core/services/bloc/task_bloc/bloc/task_bloc.dart';
import '../view/task_list_view.dart';

abstract class TaskListViewModel extends State<TaskListView> {
  @override
  void initState() {
    context.read<TaskBloc>().add(LoadTask());
    super.initState();
  }

  void openNewTask(BuildContext context) {
    context.read<NewTaskCubit>().clearCubit();
    Scaffold.of(context).openEndDrawer();
  }

  void closeSelectionMode() {
    context.read<TaskBloc>().add(LoadTask());
  }

  void openSelectionMode() {
    context.read<TaskBloc>().emit(TaskSelection(
        selectedTaskList: const [],
        waitingTaskList:
            (context.read<TaskBloc>().state as TaskLoaded).waitingTaskList,
        doneTaskList:
            (context.read<TaskBloc>().state as TaskLoaded).doneTaskList));
  }

  void addAllDone() {
    context.read<TaskBloc>().add(
          DoneTask(
            taskList: (context.read<TaskBloc>().state as TaskSelection)
                .selectedTaskList,
          ),
        );
  }

  void openCalendarPage() {}

  void openDonePage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const DoneTaskView(),
    ));
  }
}
