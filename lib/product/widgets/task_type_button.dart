import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';
import 'package:todo_app/product/widgets/circle_task_type_icon.dart';

import '../../core/const/padding.dart';
import '../model/task_type/task_type.dart';

class TaskTypeButton extends StatelessWidget {
  const TaskTypeButton({Key? key, required this.type}) : super(key: key);

  final TaskType type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskCubit, NewTaskState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            //Select type
            context.read<NewTaskCubit>().changeType(type);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const PaddingConst.smallSymmetricVertical(),
                child: AnimatedOpacity(
                  duration: context.durationLow,
                  opacity: state is NewTaskFilling
                      ? state.newTask.taskType == type
                          ? 1
                          : 0
                      : 0,
                  child: Container(
                    height: context.dynamicHeight(0.0125),
                    width: context.dynamicWidth(0.0125),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(type.colorList.first),
                          Color(type.colorList.last),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.075),
                width: context.dynamicWidth(0.075),
                child: CircleTaskTypeIcon(taskType: type),
              ),
            ],
          ),
        );
      },
    );
  }
}
