import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/services/provider/theme_provider.dart';
import 'package:todo_app/product/widgets/error_animation.dart';

import '../../core/const/color.dart';
import '../../core/const/image.dart';
import '../../core/const/padding.dart';
import '../../core/const/radius.dart';
import '../../core/services/bloc/task_bloc/bloc/task_bloc.dart';
import '../model/task/task.dart';

class SelectionBorderButton extends StatelessWidget {
  const SelectionBorderButton({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const RadiusConst.smallAll(),
        onTap: () {
          context.read<TaskBloc>().add(SelectTask(selectedTask: task));
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: const RadiusConst.smallAll(),
            color: context.watch<ThemeProvider>().selectionButtonBackground,
            border: Border.all(
              color: const Color(ColorConst.palatinateBlue).withOpacity(0.2),
            ),
            boxShadow: [
              BoxShadow(
                  color: const Color(ColorConst.deepPink).withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2)),
            ],
          ),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskSelection) {
                return AnimatedOpacity(
                  duration: context.durationLow,
                  opacity: state.selectedTaskList.contains(task) ? 1 : 0,
                  child: Padding(
                    padding: const PaddingConst.smallAll(),
                    child: SvgPicture.asset(
                      ImageConst.doneIconPath,
                      color: Color(
                        task.taskType.colorList.first,
                      ),
                    ),
                  ),
                );
              }

              return const Center(
                child: ErrorAnimation(),
              );
            },
          ),
        ),
      ),
    );
  }
}
