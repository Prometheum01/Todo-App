import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/features/screens/done_task/view_model/done_task_view_model.dart';
import 'package:todo_app/features/screens/task_list/view/task_list_view.dart';
import 'package:todo_app/product/model/task/task.dart';

import '../../../../core/const/color.dart';
import '../../../../core/const/image.dart';
import '../../../../core/const/padding.dart';
import '../../../../core/services/bloc/task_bloc/bloc/task_bloc.dart';
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
            'DONE TASKS',
            style: context.textTheme.headline2,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
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
                //TODO:Loading widget will add
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is TaskLoaded) {
                List<Task> list = state.doneTaskList;
                return Stack(
                  children: [
                    ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (context, index) => const Padding(
                          padding: PaddingConst.smallSymmetricVertical()),
                      itemBuilder: (context, index) => TaskTile(
                        task: list[index],
                        isLeftDone: false,
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
