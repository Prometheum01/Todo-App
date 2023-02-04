import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/const/decoration.dart';
import 'package:todo_app/core/const/padding.dart';

import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/features/screens/task_detail/view_model/task_detail_view_model.dart';
import 'package:todo_app/product/model/task/task.dart';
import 'package:todo_app/product/widgets/widgets.dart';

import '../../../../core/services/provider/theme_provider.dart';

part 'package:todo_app/features/screens/task_detail/components/title.dart';
part 'package:todo_app/features/screens/task_detail/components/date_time.dart';
part 'package:todo_app/features/screens/task_detail/components/description.dart';
part 'package:todo_app/features/screens/task_detail/components/description_title.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({super.key, required this.task});

  final Task task;

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends TaskDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecorationConst.whiteRounded(
        context.watch<ThemeProvider>().cardColor,
        context.watch<ThemeProvider>().cardShadowColor,
      ),
      child: Padding(
        padding: const PaddingConst.mediumAll(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleTaskTypeIcon(taskType: task.taskType),
            Padding(
              padding: const PaddingConst.mediumSymmetricVertical(),
              child: _Title(text: task.title),
            ),
            _DateTime(
              date: task.date.formatDate,
              time: task.time.formatTime,
            ),
            const Padding(
              padding: PaddingConst.mediumSymmetricVertical(),
              child: _DescriptionTitle(),
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: _Description(
                  description: task.description,
                ),
              ),
            ),
            Padding(
              padding: const PaddingConst.mediumSymmetricVertical(),
              child: GradientButton(
                onPressed: () {
                  closePage();
                },
                text: StringConst.done.toUpperCase(),
                colorList: [
                  Color(task.taskType.colorList.first),
                  Color(task.taskType.colorList.last),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
