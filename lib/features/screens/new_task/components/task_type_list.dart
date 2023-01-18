part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _TaskTypeList extends StatelessWidget {
  const _TaskTypeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringConst.icon.toTitleCase(),
          style: context.textTheme.headline5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TaskTypeButton(type: TaskType.taskList[0]),
            TaskTypeButton(type: TaskType.taskList[1]),
            TaskTypeButton(type: TaskType.taskList[2]),
            TaskTypeButton(type: TaskType.taskList[3]),
            TaskTypeButton(type: TaskType.taskList[4]),
            TaskTypeButton(type: TaskType.taskList[5]),
          ],
        ),
      ],
    );
  }
}
