import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/product/widgets/task_tile/task_tile_view_model.dart';

import '../../../core/const/radius.dart';
import '../../model/task/task.dart';
import '../../model/task_type/task_type.dart';

import '../widgets.dart';
import 'main_tile.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
    required this.task,
    this.isLeftDone = true,
  }) : super(key: key);

  final Task task;

  final bool isLeftDone;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends TaskTileViewModel {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: Stack(
        children: [
          MainTile(
              task: widget.task,
              isSelectionMode: false,
              isDonePage: !widget.isLeftDone),
          PageView(
            controller: controller,
            children: [
              GradientContainerButton(
                onPressed: () {
                  if (widget.isLeftDone) {
                    selectDone();
                  } else {
                    selectUndone();
                  }

                  controller.jumpToPage(1);
                },
                text: widget.isLeftDone ? StringConst.done : StringConst.undone,
                colorList: widget.task.taskType.colorList,
              ),
              Material(
                color: Colors.transparent,
                borderRadius: const RadiusConst.smallAll(),
                child: InkWell(
                  borderRadius: const RadiusConst.smallAll(),
                  onLongPress: () {
                    openSelectionMode();
                  },
                  splashColor: Color(widget.task.taskType.colorList.first)
                      .withOpacity(0.18),
                  child: Ink(),
                ),
              ),
              GradientContainerButton(
                onPressed: () {
                  selectRemove();
                  controller.jumpToPage(1);
                },
                text: StringConst.remove.toUpperCase(),
                colorList: TaskType.removeType.colorList,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
