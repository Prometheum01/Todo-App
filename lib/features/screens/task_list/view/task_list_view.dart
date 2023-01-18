import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
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
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            return Center(
              child: Text('Loaded Mode'),
            );
          }

          if (state is TaskSelection) {
            return Center(
              child: Text('Selection Mode'),
            );
          }

          //Todo:Error widget will add
          return const Center(
            child: Text('Something get wrong...'),
          );
        },
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
