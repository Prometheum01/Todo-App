import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/features/screens/done_task/view_model/done_task_view_model.dart';
import 'package:todo_app/product/model/task/task.dart';
import 'package:todo_app/product/widgets/error_animation.dart';
import 'package:todo_app/product/widgets/loading_animation.dart';

import '../../../../core/const/color.dart';
import '../../../../core/const/image.dart';
import '../../../../core/const/padding.dart';
import '../../../../core/services/bloc/task_bloc/bloc/task_bloc.dart';
import '../../../../product/widgets/circle_button_row.dart';
import '../../../../product/widgets/custom_background.dart';
import '../../../../product/widgets/gradient_icon_button.dart';
import '../../../../product/widgets/task_tile/main_tile.dart';
import '../../../../product/widgets/task_tile/task_tile_view.dart';

class DoneTaskView extends StatefulWidget {
  const DoneTaskView({super.key});

  @override
  State<DoneTaskView> createState() => _DoneTaskViewState();
}

class _DoneTaskViewState extends DoneTaskViewModel {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            StringConst.doneTasks.toUpperCase(),
            style: context.textTheme.displayMedium,
          ),
          leading: IconButton(
            onPressed: () {
              closePage();
            },
            icon: SvgPicture.asset(
              ImageConst.backwardIconPath,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const PaddingConst.mediumSymmetricHorizontal(),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskLoading) {
                return const Center(
                  child: LoadingAnimation(),
                );
              }

              if (state is TaskLoaded) {
                List<Task> list = state.doneTaskList;
                return ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (context, index) => const Padding(
                      padding: PaddingConst.smallSymmetricVertical()),
                  itemBuilder: (context, index) => TaskTile(
                    task: list[index],
                    isLeftDone: false,
                  ),
                );
              }

              if (state is TaskSelection) {
                List<Task> list = state.doneTaskList;
                return Stack(
                  children: [
                    ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (context, index) => const Padding(
                          padding: PaddingConst.smallSymmetricVertical()),
                      itemBuilder: (context, index) => MainTile(
                        task: list[index],
                        isSelectionMode: true,
                        isDonePage: true,
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
                              iconPath: ImageConst.doubleUndoneIconPath,
                              colorList: const [
                                Color(ColorConst.palatinateBlue),
                                Color(ColorConst.deepPink),
                              ],
                              onPressed: () {
                                //mark done selected task
                                addAllUndone();
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
}
