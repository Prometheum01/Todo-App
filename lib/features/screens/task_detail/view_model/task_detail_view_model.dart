import 'package:flutter/material.dart';

import '../../../../product/model/task/task.dart';
import '../view/task_detail_view.dart';

abstract class TaskDetailViewModel extends State<TaskDetailView> {
  late final Task task;

  @override
  void initState() {
    super.initState();
    task = widget.task;
  }

  void closePage() {
    Navigator.of(context).pop();
  }
}
