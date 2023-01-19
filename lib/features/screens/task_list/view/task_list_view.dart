import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/const/padding.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:todo_app/features/screens/new_task/view/new_task_view.dart';
import 'package:todo_app/product/widgets/widgets.dart';

import '../../../../product/widgets/task_tile/main_tile.dart';
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
      body: Padding(
        padding: const PaddingConst.mediumSymmetricHorizontal(),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              //TODO:Loading widget will add
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is TaskLoaded) {
              return ListView.separated(
                itemCount: state.waitingTaskList.length,
                separatorBuilder: (context, index) => const Padding(
                    padding: PaddingConst.smallSymmetricVertical()),
                itemBuilder: (context, index) =>
                    TaskTile(task: state.waitingTaskList[index]),
              );
            }

            if (state is TaskSelection) {
              return ListView.separated(
                itemCount: state.waitingTaskList.length,
                separatorBuilder: (context, index) => const Padding(
                    padding: PaddingConst.smallSymmetricVertical()),
                itemBuilder: (context, index) => MainTile(
                  task: state.waitingTaskList[index],
                  isSelectionMode: true,
                ),
              );
            }

            //TODO:Error widget will add

            return const Center(
              child: Text('Something get wrong...'),
            );
          },
        ),
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
