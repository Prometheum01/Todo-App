import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/core/services/bloc/slide_cubit/cubit/slide_cubit.dart';
import 'package:todo_app/product/widgets/task_tile/task_tile_view_model.dart';

import '../../../core/const/radius.dart';
import '../../model/task/task.dart';
import '../../model/task_type/task_type.dart';

import '../widgets.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
    required this.task,
    this.isIncludeDoneButton = true,
    this.isSelectionMode = false,
  }) : super(key: key);

  final Task task;

  final bool isIncludeDoneButton;
  final bool isSelectionMode;

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
            isSelectionMode: widget.isSelectionMode,
            isDonePage: !widget.isIncludeDoneButton,
          ),
          widget.isSelectionMode
              ? const SizedBox.shrink()
              : BlocBuilder<SlideCubit, SlideState>(
                  builder: (context, state) {
                    if (state is SliderSelected) {
                      if (state.task != widget.task) {
                        try {
                          controller.animateToPage(1,
                              duration: context.durationLow,
                              curve: Curves.linear);
                        } catch (e) {
                          //If controller does not initialize, it throw exception because of animateToPage
                        }
                      }
                    }

                    return PageView(
                      controller: controller,
                      onPageChanged: state is SlideInitial
                          ? (value) {
                              context
                                  .read<SlideCubit>()
                                  .changeSliderTask(widget.task);
                            }
                          : (value) {
                              if (value == 1) {
                                context.read<SlideCubit>().removeSliderTask();
                              } else {
                                context
                                    .read<SlideCubit>()
                                    .changeSliderTask(widget.task);
                              }
                            },
                      children: [
                        GradientContainerButton(
                          onPressed: () {
                            if (widget.isIncludeDoneButton) {
                              selectDone();
                            } else {
                              selectUndone();
                            }

                            controller.jumpToPage(1);
                          },
                          text: widget.isIncludeDoneButton
                              ? StringConst.done
                              : StringConst.undone,
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
                            onTap: () {
                              openDetailSheet();
                            },
                            splashColor:
                                Color(widget.task.taskType.colorList.first)
                                    .withOpacity(0.18),
                            child: Ink(),
                          ),
                        ),
                        GradientContainerButton(
                          onPressed: () {
                            selectRemove();
                            controller.jumpToPage(1);
                          },
                          text: StringConst.remove,
                          colorList: TaskType.removeType.colorList,
                        ),
                      ],
                    );
                  },
                ),
        ],
      ),
    );
  }
}
