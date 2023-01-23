import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/color.dart';
import 'package:todo_app/core/const/image.dart';
import 'package:todo_app/core/const/padding.dart';
import 'package:todo_app/core/const/radius.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:todo_app/features/screens/new_task/view/new_task_view.dart';
import 'package:todo_app/product/model/task/task.dart';
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
    return CustomBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'TODO',
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
        ),
        backgroundColor: Colors.transparent,
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
                List<Task> list = state.waitingTaskList;
                return Stack(
                  children: [
                    ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (context, index) => const Padding(
                          padding: PaddingConst.smallSymmetricVertical()),
                      itemBuilder: (context, index) => TaskTile(
                        task: list[index],
                        isLeftDone: true,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const PaddingConst.mediumSymmetricVertical(),
                        child: CircleButtonRow(
                          iconButtonList: [
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
                              colorList: const [Colors.white, Colors.white],
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
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }

              if (state is TaskSelection) {
                List<Task> list = state.waitingTaskList;

                return Stack(
                  children: [
                    ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (context, index) => const Padding(
                          padding: PaddingConst.smallSymmetricVertical()),
                      itemBuilder: (context, index) => MainTile(
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
                          iconButtonList: [
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
                          ],
                        ),
                      ),
                    )
                  ],
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
      ),
    );
  }
}

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color(ColorConst.background),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -16,
          right: -16,
          child: SvgPicture.asset(
            ImageConst.backgroundPath,
            fit: BoxFit.fill,
          ),
        ),
        child
      ],
    );
  }
}

class CircleButtonRow extends StatelessWidget {
  const CircleButtonRow({
    Key? key,
    required this.iconButtonList,
  }) : super(key: key);

  final List<GradientIconButton> iconButtonList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.15) * iconButtonList.length,
      child: Material(
        color: Colors.transparent,
        child: Builder(
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: iconButtonList,
            );
          },
        ),
      ),
    );
  }
}

class GradientIconButton extends StatelessWidget {
  const GradientIconButton({
    Key? key,
    required this.onPressed,
    required this.colorList,
    required this.iconPath,
  }) : super(key: key);

  final Function onPressed;
  final List<Color> colorList;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      borderRadius: const RadiusConst.circleAll(),
      child: Ink(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: colorList,
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                  color: colorList.first.withOpacity(0.3))
            ]),
        child: Padding(
          padding: const PaddingConst.mediumAll(),
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
