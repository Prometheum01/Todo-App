import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';

import '../../../core/const/radius.dart';
import '../../model/task/task.dart';
import '../../model/task_type/task_type.dart';

import '../widgets.dart';
import 'main_tile.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  selectDone() {}

  selectRemove() {}

  openSelectionMode(BuildContext context) {
    context.read<TaskBloc>().emit(TaskSelection(
        selectedTaskList: [task],
        waitingTaskList:
            (context.read<TaskBloc>().state as TaskLoaded).waitingTaskList,
        doneTaskList:
            (context.read<TaskBloc>().state as TaskLoaded).doneTaskList));
  }

  final PageController controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: Stack(
        children: [
          MainTile(task: task, isSelectionMode: false),
          PageView(
            controller: controller,
            children: [
              GradientContainerButton(
                  onPressed: () {
                    selectDone();
                  },
                  text: StringConst.done.toUpperCase(),
                  type: task.taskType),
              Material(
                color: Colors.transparent,
                borderRadius: const RadiusConst.smallAll(),
                child: InkWell(
                  borderRadius: const RadiusConst.smallAll(),
                  onLongPress: () {
                    openSelectionMode(context);
                  },
                  splashColor:
                      Color(task.taskType.colorList.first).withOpacity(0.18),
                  child: Ink(),
                ),
              ),
              GradientContainerButton(
                onPressed: () {
                  selectRemove();
                },
                text: StringConst.remove.toUpperCase(),
                type: TaskType.removeType,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
