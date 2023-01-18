import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';
import 'package:todo_app/product/model/task/task.dart';

import '../view/new_task_view.dart';

abstract class NewTaskViewModel extends State<NewTaskView> {
  late TextEditingController titleController, descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  addNewTask() {
    //Control values are valid
    //Add Bloc List
    //Add Hive

    Task task = (context.read<NewTaskCubit>().state as NewTaskFilling)
        .newTask
        .copyWith(
            title: titleController.text,
            description: descriptionController.text);

    Navigator.of(context).pop();
  }
}
