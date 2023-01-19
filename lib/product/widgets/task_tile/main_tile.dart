import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/image.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';

import '../../../core/const/color.dart';
import '../../../core/const/padding.dart';
import '../../../core/const/radius.dart';
import '../../model/task/task.dart';
import '../widgets.dart';

class MainTile extends StatelessWidget {
  const MainTile({
    Key? key,
    required this.task,
    this.isSelectionMode = false,
  }) : super(key: key);

  final Task task;
  final bool isSelectionMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.1),
      decoration: BoxDecoration(
        borderRadius: const RadiusConst.smallAll(),
        color: Colors.white.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const PaddingConst.smallSymmetricHorizontal(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: TaskTypeCircle(type: task.taskType),
            ),
            Expanded(
              flex: 7,
              child: Text(
                task.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: context.textTheme.headline3,
              ),
            ),
            Flexible(
              flex: 1,
              child: isSelectionMode
                  ? Material(
                      borderRadius: const RadiusConst.smallAll(),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const RadiusConst.smallAll(),
                        onTap: () {
                          context
                              .read<TaskBloc>()
                              .add(SelectTask(selectedTask: task));
                        },
                        child: Ink(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            borderRadius: const RadiusConst.smallAll(),
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(ColorConst.palatinateBlue)
                                  .withOpacity(0.2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(ColorConst.deepPink)
                                      .withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: BlocBuilder<TaskBloc, TaskState>(
                            builder: (context, state) {
                              if (state is TaskSelection) {
                                return AnimatedOpacity(
                                  duration: context.durationLow,
                                  opacity: state.selectedTaskList.contains(task)
                                      ? 1
                                      : 0,
                                  child: Padding(
                                    padding: const PaddingConst.smallAll() / 2,
                                    child: SvgPicture.asset(
                                        ImageConst.doneIconPath),
                                  ),
                                );
                              }

                              return Center(
                                child: Text('Something went wrong!'),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        style: context.textTheme.headline4
                            ?.copyWith(fontWeight: FontWeight.w900),
                        text: task.date.formatDate,
                        children: [
                          TextSpan(
                            text: '\n${task.time.formatTime}',
                            style: context.textTheme.headline6,
                          )
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
