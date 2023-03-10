import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:todo_app/product/model/task/task.dart';

import '../view/new_task_view.dart';

abstract class NewTaskViewModel extends State<NewTaskView> {
  late TextEditingController titleController, descriptionController;
  late final validatorKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  void addNewTask() {
    if (validatorKey.currentState!.validate()) {
      Task newTask = (context.read<NewTaskCubit>().state as NewTaskFilling)
          .newTask
          .copyWith(
            title: titleController.text,
            description: descriptionController.text,
            createdTime: DateTime.now().toString(),
          );

      context.read<TaskBloc>().add(AddNewTask(newTaskList: [newTask]));

      Navigator.of(context).pop();
    }
  }
}
