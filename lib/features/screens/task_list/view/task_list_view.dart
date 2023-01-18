import 'package:flutter/material.dart';
import 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

import '../view_model/task_list_view_model.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends TaskListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [SizedBox()],
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: const NewTaskView(),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            openNewTask(context);
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
