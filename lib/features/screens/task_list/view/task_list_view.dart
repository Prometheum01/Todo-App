import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/color.dart';
import 'package:todo_app/core/const/image.dart';
import 'package:todo_app/core/const/padding.dart';

import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/core/extension/list_extension.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:todo_app/core/services/provider/theme_provider.dart';
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
        endDrawer: const Drawer(
          child: NewTaskView(),
        ),
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

                list = list.sortTaskList;

                return Stack(
                  children: [
                    ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const PaddingConst.smallSymmetricVertical(),
                        child: TaskTile(
                          task: list[index],
                          isIncludeDoneButton: true,
                          isSelectionMode: state is TaskSelection,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const PaddingConst.smallAll(),
                      child: Align(
                        alignment: Alignment.bottomCenter,
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
                                      openCalendarPage();
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
        style: context.textTheme.displayMedium,
      ),
      actions: [
        IconButton(
          onPressed: openDonePage,
          icon: SvgPicture.asset(
            ImageConst.doneTaskListIconPath,
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<ThemeProvider>().changeTheme();
          },
          icon: SvgPicture.asset(
            ImageConst.cancelIconPath,
          ),
        ),
      ],
    );
  }
}
