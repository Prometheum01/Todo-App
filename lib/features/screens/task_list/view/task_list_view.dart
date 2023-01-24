import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/color.dart';
import 'package:todo_app/core/const/image.dart';
import 'package:todo_app/core/const/padding.dart';

import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:todo_app/features/screens/new_task/view/new_task_view.dart';
import 'package:todo_app/product/model/task/task.dart';

import 'package:todo_app/product/widgets/widgets.dart';

import '../view_model/task_list_view_model.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends TaskListViewModel {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        appBar: _appBar(),
        backgroundColor: Colors.transparent,
        endDrawerEnableOpenDragGesture: false,
        endDrawer: const NewTaskView(),
        body: Padding(
          padding: const PaddingConst.mediumSymmetricHorizontal(),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskLoading) {
                return const Center(
                  child: LoadingAnimation(),
                );
              }

              if (state is TaskLoaded || state is TaskSelection) {
                List<Task> list = [];

                if (state is TaskLoaded) {
                  list = state.waitingTaskList;
                } else if (state is TaskSelection) {
                  list = state.waitingTaskList;
                }

                return Stack(
                  children: [
                    ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (context, index) => const Padding(
                          padding: PaddingConst.smallSymmetricVertical()),
                      itemBuilder: (context, index) => (state is TaskLoaded)
                          ? TaskTile(
                              task: list[index],
                              isLeftDone: true,
                            )
                          : MainTile(
                              task: list[index],
                              isSelectionMode: true,
                              isDonePage: false,
                            ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const PaddingConst.mediumSymmetricVertical(),
                        child: CircleButtonRow(
                          iconButtonList: (state is TaskLoaded)
                              ? [
                                  GradientIconButton(
                                    iconPath: ImageConst.doneWhiteIconPath,
                                    colorList: const [
                                      Color(ColorConst.deepPink),
                                      Color(ColorConst.palatinateBlue),
                                    ],
                                    onPressed: () {
                                      openSelectionMode();
                                    },
                                  ),
                                  GradientIconButton(
                                    iconPath: ImageConst.calendarIconPath,
                                    colorList: const [
                                      Colors.white,
                                      Colors.white
                                    ],
                                    onPressed: () {
                                      //Open calendar page
                                    },
                                  ),
                                  GradientIconButton(
                                    iconPath: ImageConst.addIconPath,
                                    colorList: const [
                                      Color(ColorConst.palatinateBlue),
                                      Color(ColorConst.aqua),
                                    ],
                                    onPressed: () {
                                      openNewTask(context);
                                    },
                                  ),
                                ]
                              : [
                                  GradientIconButton(
                                    iconPath: ImageConst.cancelIconPath,
                                    colorList: const [
                                      Color(ColorConst.yankeesBlue),
                                      Color(ColorConst.romanSilver),
                                    ],
                                    onPressed: () {
                                      //Close select mode
                                      closeSelectionMode();
                                    },
                                  ),
                                  GradientIconButton(
                                    iconPath: ImageConst.doubleDoneIconPath,
                                    colorList: const [
                                      Color(ColorConst.palatinateBlue),
                                      Color(ColorConst.deepPink),
                                    ],
                                    onPressed: () {
                                      //mark done selected task
                                      addAllDone();
                                    },
                                  ),
                                  GradientIconButton(
                                    iconPath: ImageConst.removeIconPath,
                                    colorList: const [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    onPressed: () {
                                      //remove all
                                      removeAll();
                                    },
                                  ),
                                ],
                        ),
                      ),
                    )
                  ],
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

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        StringConst.todo.toUpperCase(),
        style: context.textTheme.headline2,
      ),
      actions: [
        IconButton(
          onPressed: () {
            //Open done task page
            openDonePage();
          },
          icon: SvgPicture.asset(
            ImageConst.doneTaskListIconPath,
          ),
        )
      ],
    );
  }
}
