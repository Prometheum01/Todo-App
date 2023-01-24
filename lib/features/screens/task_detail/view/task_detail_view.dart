import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/color.dart';
import 'package:todo_app/core/const/padding.dart';
import 'package:todo_app/core/const/radius.dart';
import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/features/screens/task_detail/view_model/task_detail_view_model.dart';
import 'package:todo_app/product/model/task/task.dart';
import 'package:todo_app/product/widgets/custom_gradient_button.dart';
import 'package:todo_app/product/widgets/widgets.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({super.key, required this.task});

  final Task task;

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends TaskDetailViewModel {
  late final Task task;

  @override
  void initState() {
    super.initState();
    task = widget.task;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white, borderRadius: RadiusConst.smallAll()),
      child: Padding(
        padding: const PaddingConst.largeAll(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientIconCircle(type: task.taskType),
            Padding(
              padding: const PaddingConst.smallTopMediumBottom(),
              child: Text(
                task.title,
                style: context.textTheme.headline1,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${task.date.formatDate}  ',
                style: context.textTheme.headline4,
                children: [
                  TextSpan(
                    text: task.time.formatTime,
                    style: context.textTheme.headline6?.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const PaddingConst.largeSymmetricVertical(),
              child: Text(
                StringConst.description.toCapitalized(),
                style: context.textTheme.headline4
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  task.description,
                  style: context.textTheme.headline3?.copyWith(
                    color: const Color(ColorConst.descriptionColor),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const PaddingConst.xLargeTop(),
              child: GradientButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
