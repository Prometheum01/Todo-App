import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';

import '../view/task_list_view.dart';

abstract class TaskListViewModel extends State<TaskListView> {
  void openNewTask(BuildContext context) {
    context.read<NewTaskCubit>().clearCubit();
    Scaffold.of(context).openEndDrawer();
  }
}
